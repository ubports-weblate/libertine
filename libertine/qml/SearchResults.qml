/**
 * @file SearchResults.qml
 * @brief Libertine search results list view component
 */
/*
 * Copyright 2015-2016 Canonical Ltd
 *
 * Libertine is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, version 3, as published by the
 * Free Software Foundation.
 *
 * Libertine is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.Popups 1.2


UbuntuListView {
    id: listView
    anchors.fill: parent
    
    delegate: ListItem {
        id: packageItem
        Label {
            text: model.package_desc
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: units.gu(2)
            }
        }
        trailingActions: ListItemActions {
            actions: [
                Action {
                    iconName: "select"
                    description: i18n.tr("Install Package")
                    onTriggered: {
                         if (!containerConfigList.isAppInstalled(mainView.currentContainer, model.package_name)) {
                             pageStack.pop()
                             pageStack.currentPage.installPackage(model.package_name)
                         }
                         else {
                             PopupUtils.open(Qt.resolvedUrl("PackageExistsDialog.qml"), null, {"package_name": model.package_name})
                         }
                    }
                }
            ]
        }
    }
}
