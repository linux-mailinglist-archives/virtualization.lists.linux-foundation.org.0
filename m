Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2111844408E
	for <lists.virtualization@lfdr.de>; Wed,  3 Nov 2021 12:25:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BDCE4047D;
	Wed,  3 Nov 2021 11:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zq9jKCRDhSi5; Wed,  3 Nov 2021 11:25:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5A06C40475;
	Wed,  3 Nov 2021 11:25:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7802C0036;
	Wed,  3 Nov 2021 11:25:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A639FC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 11:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D9AE60823
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 11:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chZWN5Xms7FK
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 11:25:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DB0F60815
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 11:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id 384381F45615
From: Maksym Wezdecki <maksym.wezdecki@collabora.com>
To: David Airlie <airlied@linux.ie>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] drm/virtio: new ioctl for pinning and lazy pinning
Date: Wed,  3 Nov 2021 12:25:34 +0100
Message-Id: <20211103112536.126855-1-maksym.wezdecki@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

First patch implements new ioctl. If there are no pages pinned 
to bo object, then pin it.

Second patch implements concepts of lazy pin. Userspace
must opt-in for not pinning pages.

I would like to record this work here and investigate another
possibility.

Mainly, problem statement for this two patches is to reduce memory 
usage consumed by Guest. If we can avoid pinning pages for such
resources like textures, then we can use staging buffer to upload
texture data to host. 


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
