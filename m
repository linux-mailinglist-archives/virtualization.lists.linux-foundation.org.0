Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7CE6E39
	for <lists.virtualization@lfdr.de>; Mon, 28 Oct 2019 09:29:18 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 01122B79;
	Mon, 28 Oct 2019 08:29:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1B69B09
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 08:29:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5051C42D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 08:29:10 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C9BFC057E9A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 08:29:09 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id g65so9599108qkf.19
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 01:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=TEstCbCo2A34IfNfhIYJS5glo5LrO24huE9AnfpPqyQ=;
	b=jTrKqWviDXDzujq2MMx8nW8JKuWL69nSNd+qfJ/auZCChu3e2qAmkHwD7KqfU0hpBI
	7JH8mg5cjDOgVbPM75hqRCCDnm8SWe99QCCpOulpuC5qXW5pEFFnBfo4ft2PJuiQhfru
	sT4NOOA9OIqvbKuRtcirEVO+xCmbSIkweJ93KqCNiJoT/BFifMJjheeBjwJB+fHTc88i
	B3XSyKJp2Sa7bkxpQacp0HVbbdDfg5IequA5Wzf8l7fU05IJ5bNMDak3gEYeQddRvFIx
	SJQoJAxdsL4QPgP5k/Bfz3yO+LqjkhORMz0Uy6USRz3kfsP5vUubJrhEV50UqQ6tsYCt
	ytfg==
X-Gm-Message-State: APjAAAWnh9Vm5jKTYD7o7C7Gmv+N/SeHO+QGuWjGmRbqDuGYdl9PuI9T
	04XIdIV4AQuHCEZzGLMF7CduvoYQGXcJQuXLESJ9HwjP/QCxVKl4YflbQByZTaXmE+Qc5FmumwG
	ZVGZC65hpkr30FG4FW57x/lpYmWGNpWgJxLYTMNB/ag==
X-Received: by 2002:aed:3f57:: with SMTP id q23mr16465410qtf.116.1572251347046;
	Mon, 28 Oct 2019 01:29:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLdytRtyQSRlOb9dIoxlBq2bbD5QdrFqf7Tqp77Wjtktzppbf9MqWxjD7XcgwiY5KTHskd+Q==
X-Received: by 2002:aed:3f57:: with SMTP id q23mr16465398qtf.116.1572251346882;
	Mon, 28 Oct 2019 01:29:06 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	j5sm5233072qkd.56.2019.10.28.01.29.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 01:29:05 -0700 (PDT)
Date: Mon, 28 Oct 2019 04:29:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: cleanups and fixes
Message-ID: <20191028042900-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org, yong.liu@intel.com
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

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to b3683dee840274e9997d958b9d82e5de95950f0b:

  vringh: fix copy direction of vringh_iov_push_kern() (2019-10-28 04:25:04 -0400)

----------------------------------------------------------------
virtio: fixes

Some minor fixes

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Jason Wang (1):
      vringh: fix copy direction of vringh_iov_push_kern()

Marvin Liu (1):
      virtio_ring: fix stalls for packed rings

Stefano Garzarella (1):
      vsock/virtio: remove unused 'work' field from 'struct virtio_vsock_pkt'

 drivers/vhost/vringh.c       | 8 +++++++-
 drivers/virtio/virtio_ring.c | 7 +++----
 include/linux/virtio_vsock.h | 1 -
 3 files changed, 10 insertions(+), 6 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
