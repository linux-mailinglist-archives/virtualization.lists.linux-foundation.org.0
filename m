Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9A31CBCD
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 15:25:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF15986731;
	Tue, 16 Feb 2021 14:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fakiz8s6yF3j; Tue, 16 Feb 2021 14:25:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49D9286A0F;
	Tue, 16 Feb 2021 14:25:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16938C013A;
	Tue, 16 Feb 2021 14:25:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BC3DC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D98626EAA1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFENoASr5yTx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:25:18 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id D807F6F503; Tue, 16 Feb 2021 14:25:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 749946EAA1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613485515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bEYlHxQooqe+xGIkI4vm2sICM9j4dZzNidpeF7Tl3rc=;
 b=e87tq/owI4R0DnMFI47trKDKlVWU53v4dS0tDO94Hjn0wIPDqHyKkz7XpHsleSY1eZcQDD
 zi8nIJyOrtdzo2lvfGJC0pA5azCoxsxfDy6IvRSa/DfO5qF9hAwVamPgjMwhA80RbxJahq
 D+Uj4uf/sUTvyswNAixGEE0+wtDrb9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-DGN1ci5AN5eunODbYRJTMQ-1; Tue, 16 Feb 2021 09:25:10 -0500
X-MC-Unique: DGN1ci5AN5eunODbYRJTMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5190B80197B;
 Tue, 16 Feb 2021 14:25:08 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7354100AE34;
 Tue, 16 Feb 2021 14:24:40 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH for 5.10 v2 0/5] vdpa_sim: fix param validation in
 vdpasim_get_config()
Date: Tue, 16 Feb 2021 15:24:34 +0100
Message-Id: <20210216142439.258713-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

v1: https://lore.kernel.org/stable/20210211162519.215418-1-sgarzare@redhat.com/

v2:
- backport the upstream patch and related patches needed

Commit 65b709586e22 ("vdpa_sim: add get_config callback in
vdpasim_dev_attr") unintentionally solved an issue in vdpasim_get_config()
upstream while refactoring vdpa_sim.c to support multiple devices.

Before that patch, if 'offset + len' was equal to
sizeof(struct virtio_net_config), the entire buffer wasn't filled,
returning incorrect values to the caller.

Since 'vdpasim->config' type is 'struct virtio_net_config', we can
safely copy its content under this condition.

The minimum set of patches to backport the patch that fixes the issue, is the
following:

   423248d60d2b vdpa_sim: remove hard-coded virtq count
   6c6e28fe4579 vdpa_sim: add struct vdpasim_dev_attr for device attributes
   cf1a3b35382c vdpa_sim: store parsed MAC address in a buffer
   f37cbbc65178 vdpa_sim: make 'config' generic and usable for any device type
   65b709586e22 vdpa_sim: add get_config callback in vdpasim_dev_attr

The patches apply fairly cleanly. There are a few contextual differences
due to the lack of the other patches:

   $ git backport-diff -u master -r linux-5.10.y..HEAD
   Key:
   [----] : patches are identical
   [####] : number of functional differences between upstream/downstream patch
   [down] : patch is downstream-only
   The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

   001/5:[----] [--] 'vdpa_sim: remove hard-coded virtq count'
   002/5:[----] [-C] 'vdpa_sim: add struct vdpasim_dev_attr for device attributes'
   003/5:[----] [--] 'vdpa_sim: store parsed MAC address in a buffer'
   004/5:[----] [-C] 'vdpa_sim: make 'config' generic and usable for any device type'
   005/5:[----] [-C] 'vdpa_sim: add get_config callback in vdpasim_dev_attr'

Thanks,
Stefano

Max Gurtovoy (1):
  vdpa_sim: remove hard-coded virtq count

Stefano Garzarella (4):
  vdpa_sim: add struct vdpasim_dev_attr for device attributes
  vdpa_sim: store parsed MAC address in a buffer
  vdpa_sim: make 'config' generic and usable for any device type
  vdpa_sim: add get_config callback in vdpasim_dev_attr

 drivers/vdpa/vdpa_sim/vdpa_sim.c | 83 +++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 23 deletions(-)

-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
