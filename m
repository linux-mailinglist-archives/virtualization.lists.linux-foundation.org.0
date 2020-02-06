Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D7153F5D
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 08:48:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B43A870A9;
	Thu,  6 Feb 2020 07:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqV1rQja5ngk; Thu,  6 Feb 2020 07:48:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20AF386F13;
	Thu,  6 Feb 2020 07:48:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0171BC013E;
	Thu,  6 Feb 2020 07:48:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B53CFC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 07:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A57F583791
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 07:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfg57ZOKC0+A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 07:48:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F35C4816F9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580975281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vfV+T2mR+ZINyLA8LbxLyRCcFt6072JPvLxeCgd1lQo=;
 b=QTWQ+S1jTE5PQCf+1cigHJPGyLvVUd4M4A/YWE0UJkNlsyAKxz+6T5YdPhRKVOm7dmDAd5
 QGVEHNo8sz5Orr8cpR+yXGsFqlP5mBiy6MF2jHIdA+oehveg4tFI8rzJOktEiVDrqBXRkp
 CzSkpX8C/37+p9OUCszSAUI4s7UAJ0I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-xa6lTbEkNUWHu-0J_IMEQg-1; Thu, 06 Feb 2020 02:48:00 -0500
Received: by mail-qk1-f200.google.com with SMTP id k10so3038539qki.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 23:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=vfV+T2mR+ZINyLA8LbxLyRCcFt6072JPvLxeCgd1lQo=;
 b=rLI4qfD1C7L4znwmm+g7Ec/8ExB0/X/FnbCWbDZL51axRPQFuwgvBvSHGpLrUfrKhi
 mbdF2WO0LJ7tfbcvHd9/n0/EsGrlcv4DmNh2sHDMUjZpGzbXao1IUiKmTs4140+daRGd
 HX/FgpX7xWt7Pc4UjvTqdxKEGRBZ5PRxnrXM6dX1rTbZMF8iurvNX/allt4JijzXa26g
 9T72ijKGJKUZeDCGDY08kA8AJaUnRrGClr1RdUK97qxG/Gw4iDUV2alRAITvupqsmtzF
 PCVFPLruWl3ScSILG8K/oUk2cK0nBYi6z14Vb4XhCJyDlsJm8VD5UoWa7h+JUX92VrJI
 J5Xg==
X-Gm-Message-State: APjAAAWpziOsviEfa2ODEvA7RhDLdKYeFUAyEz6f0OLxWyGAnOTrj6i7
 DAza6DMemR2+Y5a5INYQswJHNHEQiADShDn5QtR9yQhOcIoaC1TooCX+a7nihirsBX6k5ByTNMc
 sdtSEQYOhaoZFTHnBQ6ifcExtUNAkFZd1DYKv+i5HBg==
X-Received: by 2002:ac8:7b9b:: with SMTP id p27mr1563780qtu.2.1580975279420;
 Wed, 05 Feb 2020 23:47:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFG1AMzWVRgSI1qX48T8kdlxIMXg0Zo6VHwW7vlPrw3PtMkvwlNKHMeCwck82QMACgkj8XhA==
X-Received: by 2002:ac8:7b9b:: with SMTP id p27mr1563767qtu.2.1580975279213;
 Wed, 05 Feb 2020 23:47:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 24sm1052973qka.32.2020.02.05.23.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 23:47:58 -0800 (PST)
Date: Thu, 6 Feb 2020 02:47:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_balloon: prevent pfn array overflow
Message-ID: <20200206074644.1177551-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: xa6lTbEkNUWHu-0J_IMEQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-mm@kvack.org, virtualization@lists.linux-foundation.org
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

Make sure, at build time, that pfn array is big enough to hold a single
page.  It happens to be true since the PAGE_SHIFT value at the moment is
20, which is 1M - exactly 256 4K balloon pages.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 8e400ece9273..2457c54b6185 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -158,6 +158,8 @@ static void set_page_pfns(struct virtio_balloon *vb,
 {
 	unsigned int i;
 
+	BUILD_BUG_ON(VIRTIO_BALLOON_PAGES_PER_PAGE > VIRTIO_BALLOON_ARRAY_PFNS_MAX);
+
 	/*
 	 * Set balloon pfns pointing at this page.
 	 * Note that the first pfn points at start of the page.
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
