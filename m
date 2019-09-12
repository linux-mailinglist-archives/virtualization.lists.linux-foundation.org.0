Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF76B0B3D
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 11:22:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F0D88CBC;
	Thu, 12 Sep 2019 09:22:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50DE4BA0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 09:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0178583A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 09:22:32 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2347D88304
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 09:22:32 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id b67so28229406qkc.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 02:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=pLxa89q30vkWfElanRX/0CULLU+24vajFa4KgDHE2hA=;
	b=ER56WmtLspKKHGK/88pf/iaGCb0qceuGHAuIo64ly+Nva/qdKS+iXqJEc4GlksrPni
	LXbrDUQcDDuqpMZgW37myUFZwWX5NGBMHjcv5ZPawrHCY/B3Iho0QYZo0gv0FW1qln5Q
	n1xQDy29PlZC2tyhuBad/42+GnrZAiXc4u7MpS3pO1mrriuLAMZ4eUYjHB5EVpquxRcq
	nWia0PQ9u1vG4BNXyydWTQHN4l9p5dKrvMqLGYrFEpytNt2Do58lhHR8u10YtnUWFVAk
	OnhdcKD1TFMQ+/Lac/jI/JheasCFbx0RybnAJxNOdN9n4IreuY8kXpehCT4hn/VZE28w
	vStw==
X-Gm-Message-State: APjAAAU0I6bs6QvCNO08YGTku8h3Y21tpz7ec9omnaBTLMADxMfwxPIv
	AhBLI7/iWLLkXvugAdafweYgum2dzjir1rf6pxWwi7tRScvJsXTARCIvACyMus/o9XZQJQENJiC
	E5DJhfuY41vGfcWFHUY5/K5mgvhOKresuv+opQ7r6lA==
X-Received: by 2002:a37:713:: with SMTP id 19mr23814920qkh.490.1568280151434; 
	Thu, 12 Sep 2019 02:22:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhC+pK6k4yXPRQ+FZIn0Yq8vOHMCy5tfY3zZL6qdx0w3f0nKj/xe3NiHa8yv2Zlz+qxLR1yA==
X-Received: by 2002:a37:713:: with SMTP id 19mr23814907qkh.490.1568280151290; 
	Thu, 12 Sep 2019 02:22:31 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	h29sm14774022qtb.46.2019.09.12.02.22.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 02:22:30 -0700 (PDT)
Date: Thu, 12 Sep 2019 05:22:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] virtio: last minute bugfixes
Message-ID: <20190912052224-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, ruippan@tencent.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org, yongduan@tencent.com,
	matthias.lange@kernkonzept.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The following changes since commit 02fa5d7b17a761f53ef1eedfc254e1f33bd226b0:

  mm/balloon_compaction: suppress allocation warnings (2019-09-04 07:42:01 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 060423bfdee3f8bc6e2c1bac97de24d5415e2bc4:

  vhost: make sure log_num < in_num (2019-09-11 15:15:26 -0400)

----------------------------------------------------------------
virtio: last minute bugfixes

A couple of security things.

And an error handling bugfix that is never encountered by most people,
but that also makes it kind of safe to push at the last minute, and it
helps push the fix to stable a bit sooner.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Matthias Lange (1):
      virtio_ring: fix unmap of indirect descriptors

Michael S. Tsirkin (1):
      vhost: block speculation of translated descriptors

yongduan (1):
      vhost: make sure log_num < in_num

 drivers/vhost/vhost.c        | 10 ++++++----
 drivers/virtio/virtio_ring.c |  8 ++++++--
 2 files changed, 12 insertions(+), 6 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
