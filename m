Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAB33225
	for <lists.virtualization@lfdr.de>; Mon,  3 Jun 2019 16:30:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 71ED8CC4;
	Mon,  3 Jun 2019 14:30:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD581BB3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 14:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 76E045D3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 14:30:30 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 14so9625713qtf.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 07:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=gQn+opkBLJ7k/C3qZHsVRJKAD54wHEXBCLQZNaHpEEk=;
	b=OEwFj29FD7bYVMZ+qE5XmQ18j2XMrCoJrU/QadCyAkLIv6Ef4bNr6/vAxmnE5R+8oC
	vxmk4TOBl4R7SGBR4Km7wC164cN+CMpPZOW8ziDvW4N+MXt5HxMQtlgWwc85EcKLwWfu
	aFM2MWjslZKmPqE+xUjlesCuJWSxk2UK+xjU/KPTiPKlaBGNFUPjAoqEibtWRlH+I21y
	sYsG4I5M/TiKMUdi4B8Kh3bkGxiYJZiJFo71TQarQNI+/H7G204SQ1fJ1IrwtrJTNq06
	jJpjowGWeIbU+ZXE1NH8W/M3EP1dw1f7BJd2l79jt+wGJX1Jd3vLtFl8FGkO/3Sp+KY+
	Bj7A==
X-Gm-Message-State: APjAAAUtbVnfwAmYKpQn/lRJ8j5+/3CFoLQE8rePmxvStPVPNVWQPqnm
	BVHb9pQNojcEDqH+81gc7rEWvQ==
X-Google-Smtp-Source: APXvYqynmgnzb+w8bUU39lzRRCvuGvLx9i0A1MLtbYk3Pg68IkNm66teD3X5Pu2eUYYljcP/hxDNUw==
X-Received: by 2002:ac8:376e:: with SMTP id p43mr23617764qtb.354.1559572229588;
	Mon, 03 Jun 2019 07:30:29 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id z12sm166896qkf.20.2019.06.03.07.30.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 07:30:28 -0700 (PDT)
Date: Mon, 3 Jun 2019 10:30:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: cleanups and fixes
Message-ID: <20190603103027-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: fabrizio.castro@bp.renesas.com, igor.stoppa@huawei.com, kvm@vger.kernel.org,
	mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com
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

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to c1ea02f15ab5efb3e93fc3144d895410bf79fcf2:

  vhost: scsi: add weight support (2019-05-27 11:08:23 -0400)

----------------------------------------------------------------
virtio: fixes

several fixes, some of them for CVEs.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Fabrizio Castro (1):
      virtio: Fix indentation of VIRTIO_MMIO

Igor Stoppa (1):
      virtio: add unlikely() to WARN_ON_ONCE()

Jason Wang (4):
      vhost: introduce vhost_exceeds_weight()
      vhost_net: fix possible infinite loop
      vhost: vsock: add weight support
      vhost: scsi: add weight support

 drivers/vhost/net.c         | 41 ++++++++++++++---------------------------
 drivers/vhost/scsi.c        | 21 ++++++++++++++-------
 drivers/vhost/vhost.c       | 20 +++++++++++++++++++-
 drivers/vhost/vhost.h       |  5 ++++-
 drivers/vhost/vsock.c       | 28 +++++++++++++++++++++-------
 drivers/virtio/Kconfig      |  8 ++++----
 tools/virtio/linux/kernel.h |  2 +-
 7 files changed, 77 insertions(+), 48 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
