Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F817909E
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 18:18:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EECD71A73;
	Mon, 29 Jul 2019 16:18:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5D6401A23
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:16:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EF3B05E4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:16:11 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id g11so1629433uak.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 09:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=AyvJSduUmZn33FbpJeTkP5NHm1ThVmp/uEoZugiTS6k=;
	b=Mt+s90thWrYraUy5Y3Kqp5Mz96VowTXT07gZm1i4yh2JhpzyoRBBKEw6Pduz+UZIU/
	McQoGFFJvGZO7Dn25lFVj2lBRdJgGRHQzvJr+T3rait8qhG4nP4Em1KqzvKStiQniUJ6
	qkS2vqbkaaXp11ZnFJpNu4atjOqFvFd4JCWAB+j6vxrn7tz6/oJ8g57VdlUiifA36mCK
	Lw79fdXzI01GtbznwztpQMkmeKLkXIgatkRh2s2ozaUnVmsx8Y8m1bSkDd/ksGnRHpaF
	mJVQhTanC8bfdXwOFbkd+iWdUWmhqVuFLPMm04zr/FM5k/hyGphgQ9Y6C862hdxhPGOZ
	ggpg==
X-Gm-Message-State: APjAAAXGkEBSCMTFOO5nNSC8VV5z6Jgv4aONnqakCoY88N0LCsWJEQa2
	iUirSzg5eTz9LVNOK6fpeYV05w==
X-Google-Smtp-Source: APXvYqwG8Q4XQWblCYfrnvjYrxOZIt94OjzyFiLAXTSDaMhX/fRr5dDybVH26+paFqcxZZfddeveUQ==
X-Received: by 2002:a9f:31a2:: with SMTP id v31mr67985907uad.15.1564416971073; 
	Mon, 29 Jul 2019 09:16:11 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	u5sm60539788uah.0.2019.07.29.09.16.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 09:16:10 -0700 (PDT)
Date: Mon, 29 Jul 2019 12:16:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost,virtio: cleanups and fixes
Message-ID: <20190729121605-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe@linaro.org, jroedel@suse.de, kvm@vger.kernel.org,
	mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
	namit@vmware.com
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

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 73f628ec9e6bcc45b77c53fe6d0c0ec55eaf82af:

  vhost: disable metadata prefetch optimization (2019-07-26 07:49:29 -0400)

----------------------------------------------------------------
virtio, vhost: bugfixes

Fixes in the iommu and balloon devices.
Disable the meta-data optimization for now - I hope we can get it fixed
shortly, but there's no point in making users suffer crashes while we
are working on that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Jean-Philippe Brucker (1):
      iommu/virtio: Update to most recent specification

Michael S. Tsirkin (2):
      balloon: fix up comments
      vhost: disable metadata prefetch optimization

Wei Wang (1):
      mm/balloon_compaction: avoid duplicate page removal

 drivers/iommu/virtio-iommu.c      | 40 ++++++++++++++++-------
 drivers/vhost/vhost.h             |  2 +-
 include/uapi/linux/virtio_iommu.h | 32 ++++++++++--------
 mm/balloon_compaction.c           | 69 +++++++++++++++++++++++----------------
 4 files changed, 89 insertions(+), 54 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
