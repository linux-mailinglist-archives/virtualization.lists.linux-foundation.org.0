Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAD58F92F
	for <lists.virtualization@lfdr.de>; Thu, 11 Aug 2022 10:36:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D93118140F;
	Thu, 11 Aug 2022 08:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D93118140F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P0l8IcjK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxcyvB4xTc_g; Thu, 11 Aug 2022 08:36:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A7C538140D;
	Thu, 11 Aug 2022 08:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C538140D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7952C007C;
	Thu, 11 Aug 2022 08:36:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 328CDC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDE628140D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE628140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGcl7426p_9S
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:36:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF76D8140F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF76D8140F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660207000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FWJ1TtCFzQxMqrkhZVnYiwTdjQdpAimD5051fxwruHM=;
 b=P0l8IcjKj8SQpZidHVy96URGsxYpVpuwuGg3efOkPruzVdEJkvh/dt30rivhLmIBBPR0Ta
 bidv8FqZZhzkcVZfkt94DmCi7G89PrOHhh+JjYErzwiW5KDsqUa8P0ZzPbw5la7k2m3gTt
 Twl624xjVs3jRCaYir0Ft38ZDz0MigA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-l32NEk7zOOq0LjkqK24VNQ-1; Thu, 11 Aug 2022 04:36:39 -0400
X-MC-Unique: l32NEk7zOOq0LjkqK24VNQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 hf13-20020a05622a608d00b003214b6b3777so12754307qtb.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 01:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FWJ1TtCFzQxMqrkhZVnYiwTdjQdpAimD5051fxwruHM=;
 b=H8kFjq0sWjbEGLF+1BJIN3bdFMUvC4kcDzNiLxeGkUb2SGBcR6ovehAU1Baejj0BD3
 rohpwdL5FKbDRdMYf6KtY0C1p4TLkZMX0IIb9SkFbfSMEe0aQyQv0rSlt1YcWo5Axl4E
 wCib+JPkmtU5rT9ngCoExsFVOJaSjZ9swWfWvm2UygPC9cqcEPKcHH47pmD2xR1VNjem
 XIvXpG9iL9gd1yRvlbZSW6IUUzO3J/1A9akQj1DBkqQLtBLe8vdKF4/8hAEYS1ufBpfJ
 VaT14g3dZeLFmfoNGvxJJbhrzNa4doSc5Ww1CvDOiM+JTBQkKSkWhCLhZ0AktRDoS8fb
 LGQQ==
X-Gm-Message-State: ACgBeo0ZYunxSLLJV+8KxShZ2QL9TESwHydDGgPDvUMhzDthsHCisjYa
 c3iwQIdMKCgJEdkMmON1nyLy3BoVV9vt5BaxjohWbkwlIweHFnqMj6EoZ7CWAFzOpzRHd7kXX1J
 k2cGlyKHw8+qbZHCCZZmFOfh4DsvjauX5ODG2Q1qHkieaJSuH/+89pbAS4kqncpNzDwYXhzTpAH
 gyQOeBEfq9ZLG9XdtdTA==
X-Received: by 2002:a05:620a:1903:b0:6b8:c90d:c586 with SMTP id
 bj3-20020a05620a190300b006b8c90dc586mr24032796qkb.751.1660206998181; 
 Thu, 11 Aug 2022 01:36:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HmlG9mm3nf92dLCuVNjWrcJaBVeQSRP85eCW0n/1qzGsVdE31m7ThSf9P9hFhBWfg3fK4iQ==
X-Received: by 2002:a05:620a:1903:b0:6b8:c90d:c586 with SMTP id
 bj3-20020a05620a190300b006b8c90dc586mr24032785qkb.751.1660206997914; 
 Thu, 11 Aug 2022 01:36:37 -0700 (PDT)
Received: from step1.redhat.com (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 ga25-20020a05622a591900b0034361fb2f75sm1343083qtb.22.2022.08.11.01.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:36:36 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 0/4] vdpa_sim_blk: add support for flush, discard,
 and write-zeroes
Date: Thu, 11 Aug 2022 10:36:28 +0200
Message-Id: <20220811083632.77525-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

The first 2 patches are in preparation and generalize parts later used
by the following patches that add handling of flush, discard, and
write-zeroes requests.

v3:
- fixed clang issue reported by kernel test robot <lkp@intel.com>
- used le*_to_cpu() to access virtio_blk_discard_write_zeroes fields

v2: https://lore.kernel.org/virtualization/20220810094347.20449-1-sgarzare@redhat.com/
v1: https://lore.kernel.org/virtualization/20220428151242.213824-1-sgarzare@redhat.com/

Tree available here:
https://gitlab.com/sgarzarella/linux.git vdpa-sim-blk-flush-discard-wz

Thanks,
Stefano

Stefano Garzarella (4):
  vdpa_sim_blk: check if sector is 0 for commands other than read or
    write
  vdpa_sim_blk: make vdpasim_blk_check_range usable by other requests
  vdpa_sim_blk: add support for VIRTIO_BLK_T_FLUSH
  vdpa_sim_blk: add support for discard and write-zeroes

 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 127 +++++++++++++++++++++++----
 1 file changed, 111 insertions(+), 16 deletions(-)

-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
