Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD6AB974
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 15:41:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A46D7232D;
	Fri,  6 Sep 2019 13:41:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 316EE2328
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C853C756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:41:08 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45561C053B32
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:41:08 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id o5so2552296wrg.15
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 06:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=BOudiuHTDG2nanChju52HFlrYGD+TT2yIrow4eQVhPo=;
	b=OsWsrn5pEqSYyOeWQyfK0bGqNYcwEBee132IVBrDPrP2/ir0jaXaCgdk184RGCDe/b
	gi1yE58qUXlcgpMb9B5OzdvF4PTU2EF8Y/MVC5xKDZH/btN/rbEQlO852s+mDmOKdWC8
	JTfPg7wziI0MD/BD0aoLhJF5/jPUjCFeJfluAFO4BONWHUXt5Ay+xnAQtFF6ZZQxIvEy
	lw7jM0jFMPufmiRayLKN+QKWpHmwy/vDPGEkdwvgm1qXag4jtzH0TSG2Mdhl6qEBgPM4
	0s+jBQwA41Sr60n2wZjsPM8KbkY+pzO6Nlcf2LPlz75kXeB9eLMHk4lsPX5v0UkGWk31
	P2RQ==
X-Gm-Message-State: APjAAAUH2AqPD5lc+jig5vxzX6aF0q86n0ifSUlGIqh0v//0KyyXwJwE
	I8UX6qkBv4E9a6k0/N3IFsulJrLIaJUnPMPyBTLHgPRveYsBj2NMstxfLOsOfFlLOwfeii73fxU
	EMzbBow3duSEWxXccoq0tTF1uM373uqB4riQrb4OK3g==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr7195678wrw.95.1567777266880;
	Fri, 06 Sep 2019 06:41:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxreY3DmoX89vqmIPvQ3JR7SKig36Ux54jbeXQCW2FgTU0YSZ0FueKQ+54ktkhW991OFZYpRA==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr7195662wrw.95.1567777266677;
	Fri, 06 Sep 2019 06:41:06 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	r17sm6169766wrt.68.2019.09.06.06.41.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 06:41:05 -0700 (PDT)
Date: Fri, 6 Sep 2019 09:41:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost, virtio: last minute fixes
Message-ID: <20190906094103-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	jiangkidd@hotmail.com, linux-kernel@vger.kernel.org,
	linyunsheng@huawei.com, namit@vmware.com,
	virtualization@lists.linux-foundation.org
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

Hope this can still make it.
I was not sure about virtio-net change but it seems that it prevents
livelocks for some people.

The following changes since commit 089cf7f6ecb266b6a4164919a2e69bd2f938374a:

  Linux 5.3-rc7 (2019-09-02 09:57:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 02fa5d7b17a761f53ef1eedfc254e1f33bd226b0:

  mm/balloon_compaction: suppress allocation warnings (2019-09-04 07:42:01 -0400)

----------------------------------------------------------------
virtio, vhost, balloon: bugfixes

A couple of last minute bugfixes. And a revert of a failed attempt at
metadata access optimization - we'll try again in the next cycle.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
? jiang (1):
      virtio-net: lower min ring num_free for efficiency

Michael S. Tsirkin (1):
      Revert "vhost: access vq metadata through kernel virtual address"

Nadav Amit (1):
      mm/balloon_compaction: suppress allocation warnings

Tiwei Bie (2):
      vhost/test: fix build for vhost test
      vhost/test: fix build for vhost test

Yunsheng Lin (1):
      vhost: Remove unnecessary variable

 drivers/net/virtio_net.c |   2 +-
 drivers/vhost/test.c     |  13 +-
 drivers/vhost/vhost.c    | 520 +----------------------------------------------
 drivers/vhost/vhost.h    |  41 ----
 mm/balloon_compaction.c  |   3 +-
 5 files changed, 17 insertions(+), 562 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
