Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56429EBBF
	for <lists.virtualization@lfdr.de>; Thu, 29 Oct 2020 13:21:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 972E08756A;
	Thu, 29 Oct 2020 12:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0a2Sc0GUCG5; Thu, 29 Oct 2020 12:21:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C35998734E;
	Thu, 29 Oct 2020 12:21:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 974EDC0051;
	Thu, 29 Oct 2020 12:21:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C669CC0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A04D521561
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovMVtE3xSeLA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:20:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 58AA3220B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603974055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VsGY64wc+hD5SlzcuKwVLp8jJY3JLUIdMZBJzQEsGWE=;
 b=d7uNTnjeyxcqbUuw1J7RtqckC2MRPD2RopYnXYUphTlQg2Xs3WvJv5hBlhF0mNiNSIwnUU
 jE3E5zM5qUCKCS2+6QanR1seocoXbgwVjEtbWnxSHcBDgJZGsRWkKueionm1dIP+1JXMP9
 vQDGrVWwriK/1sPteQhhD2juzXTCpoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-Z7O9eMgDMRWqA0HNr7kjlg-1; Thu, 29 Oct 2020 08:20:53 -0400
X-MC-Unique: Z7O9eMgDMRWqA0HNr7kjlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E78879525;
 Thu, 29 Oct 2020 12:20:52 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-197.ams2.redhat.com
 [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63BA155764;
 Thu, 29 Oct 2020 12:20:51 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] vdpasim: allow to set MAC address
Date: Thu, 29 Oct 2020 13:20:48 +0100
Message-Id: <20201029122050.776445-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Laurent Vivier <lvivier@redhat.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

This series starts by fixing a bug:
vdpa_sim generates a MAC address that is never show to
upper layer, and thus virtio-net generates another random
MAC address, that changes each time virtio-net is loaded
(even if vdpa_sim is not unloaded).

Then it adds a parameter to vpa_sim module to allow the user to
set the MAC address. With that we use vdpa_sim with a stable
MAC addres, that doesn't change between reboots.

Laurent Vivier (2):
  vdpasim: fix MAC address configuration
  vdpasim: allow to assign a MAC address

 drivers/vdpa/vdpa_sim/vdpa_sim.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.26.2


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
