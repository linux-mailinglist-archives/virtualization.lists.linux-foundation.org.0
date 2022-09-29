Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC605EEE9B
	for <lists.virtualization@lfdr.de>; Thu, 29 Sep 2022 09:14:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0F283385;
	Thu, 29 Sep 2022 07:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0F283385
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Ohuk+THf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQwzb1SWpdCA; Thu, 29 Sep 2022 07:14:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6B878833A8;
	Thu, 29 Sep 2022 07:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B878833A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74B2EC007C;
	Thu, 29 Sep 2022 07:14:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D7A2C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Sep 2022 07:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC4AB402B1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Sep 2022 07:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC4AB402B1
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Ohuk+THf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xv8RI2bzl9oU
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Sep 2022 07:14:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C28C400CE
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C28C400CE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Sep 2022 07:14:23 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x23-20020a056830409700b00655c6dace73so375105ott.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Sep 2022 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6i/NrOpyshZGfjV4aGBliBwD3inMehnh5np2GN2DIYc=;
 b=Ohuk+THfkw7cXyhEoFOn4qKNnzbA2AiiCrkNsP/ViNgVZTyrLqLDoFmiTSN9B3fbiO
 Mzi+Bclh79yDNmZ7ce0azKW2x5tICDaKD6H90qHw4p5Ji9GhYG4Fe4x+r00pQeZyuaqV
 OThJ8dIPN18nKW9ur10WKEXsAgAiNnrQJYXU706LwvD1nj6Y5emycgeUoqvaP/qGws82
 04T09ALibSFMbwXD4yO+z1TAmPX2qGh1Kt16BT7SMmJGaKs3xrl5DzG7Dm1X4LHKqgiq
 izaIX1oHBlyVX0FPBuC2jxparO+AoYXOkoXfRNyjkGRxl6Hk+pquggSrbTJJlaQpp4RJ
 IfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6i/NrOpyshZGfjV4aGBliBwD3inMehnh5np2GN2DIYc=;
 b=AsZGJuA0S5TXS3XSmlAmPcdezeYyK8lhNWf67QEWLbFDnXDi4Cp5nGPYz7FkVodw2b
 KdtVST2IQWPQxqawOtI8VqhLse8duRMxt84uTST6xY/KChp11ggvFmwfe/FOOFB/N6zh
 Xg1ugCx9Z8j0dxHdQdZ0+w5f6ci8UAGDm0qt4DGhSrIQrbh2/FokMUbiVThkZCQfgWCm
 +M6Se2SksfGSFQ4J4k/me1C/zCyyP+uHf3Wirh5VcJgQJuAOkxX2RSUzvJZDHxO6PuZ2
 B4dGsWWStGdzIgxzUkR44SBt/Q8Nh1+qQqYIlnYojOdX1rLg5yz0emD7JXhp6aPK+rgH
 hd4Q==
X-Gm-Message-State: ACrzQf20UQJ/mq4ujNaEo+o71DW66RE2rT0b/y+bGSQFlYuKrqeX4sGZ
 hl0u0LpkQzz7+SZ+nVxyLicu+JDlP1axLGtqIM9YgQ==
X-Google-Smtp-Source: AMsMyM6v7W/5/xlDc66+odkAj8veGmOQ6zduP4vQS1P4pA8mbT2FIQ5eJ5KohsdWEgyaGqiDFAZ8EFLaMcN61DwPNHI=
X-Received: by 2002:a05:6830:31bb:b0:654:d29:32d5 with SMTP id
 q27-20020a05683031bb00b006540d2932d5mr754605ots.130.1664435663046; Thu, 29
 Sep 2022 00:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220921082729.2516779-1-alvaro.karsz@solid-run.com>
 <YyyfJQo7N/iMPLNP@fedora>
 <CAJs=3_BXGpu-kDq1_bJSanh-iY63uwpc2tZtH6jOYcqBUptsNA@mail.gmail.com>
 <20220928091512-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220928091512-mutt-send-email-mst@kernel.org>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 29 Sep 2022 10:13:47 +0300
Message-ID: <CAJs=3_CmKjhS=Y3JHujws9y5KmN-AbSRXTnt1aZOhDzMuK7g3Q@mail.gmail.com>
Subject: Re: [PATCH v3] virtio_blk: add SECURE ERASE command support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org
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

> Could you explain this last part? Why are they used without
> VIRTIO_BLK_F_DISCARD?


Sure,

If both  VIRTIO_BLK_F_DISCARD and VIRTIO_BLK_F_SECURE_ERASE are negotiated:
q->limits.max_discard_segments =
min(virtio_blk_config->max_discard_seg,
virtio_blk_config->max_secure_erase_seg)

If VIRTIO_BLK_F_DISCARD is negotiated and VIRTIO_BLK_F_SECURE_ERASE isn't
q->limits.max_discard_segments = virtio_blk_config->max_discard_seg

If VIRTIO_BLK_F_SECURE_ERASE is negotiated and VIRTIO_BLK_F_DISCARD isn't
q->limits.max_discard_segments = virtio_blk_config->max_secure_erase_seg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
