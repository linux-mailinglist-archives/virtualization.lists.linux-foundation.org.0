Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487BD41E6
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 15:56:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7227115A5;
	Fri, 11 Oct 2019 13:56:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 07EB01596
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:46:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02EF681A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:46:00 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 774615946B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:46:00 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id z128so8955561qke.8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 06:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=o/nkRYTONx73WsD7MC8B77Hivj8w35ee4nLVJzmSYdg=;
	b=lLGddSZ3yNOyEAnbDxYcssivXkqQzjs/ZVh1TlJf42fd2XI9ESdFpnnpyJX825XtCm
	p2urJ4RasUxrgx26vFhLHl5b2VtXyy1FX/5sjVxljhOBD7ggpStOIMonHH9rIoyGvkfs
	Zo5LXJQKKFUnA/Lvqga4168eV8Evef/Ji38khwglmH9u81SywftJyb6nW9gcxFFwq/Ow
	vm+LATELC9rWQNMUu7XRePBFuNjhNTeI0zeg5lPE2SG+QEz3nOyyVod/sO1gezobaAOu
	YPaIXEiV6XDi5w17FIlOxG+ynR+BOUsa4C6tW1/PSUSSVWrrkgJZx3pBe/tsy+HvDJmL
	334g==
X-Gm-Message-State: APjAAAXNL1O0r4jbOJxdice+zJpzBxHQnuig9BnKU3eKFOXETI6xpbwh
	JPHFv4YTp2SW8/u+6gffx31OROYIrrvs2+ZBsr/TfndyNJYDB7XEVs9SzKgD6M1RKMNWSbtro4V
	TjJ5WL7JawasJ4tnOfoJksbnwFavEPy1Zsi+u5IFFuA==
X-Received: by 2002:ac8:2e10:: with SMTP id r16mr17460325qta.62.1570801559693; 
	Fri, 11 Oct 2019 06:45:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNkV+IdP+Wd7WKMbrFt0Q607s9maou4ckQQ4vu7F/qkVJUOjLTGMKOgQL8yhEDf1yVy213sQ==
X-Received: by 2002:ac8:2e10:: with SMTP id r16mr17460293qta.62.1570801559470; 
	Fri, 11 Oct 2019 06:45:59 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	w6sm3944120qkj.136.2019.10.11.06.45.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 06:45:58 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:45:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH RFC v1 0/2] vhost: ring format independence
Message-ID: <20191011134358.16912-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

So the idea is as follows: we convert descriptors to an
independent format first, and process that converting to
iov later.

The point is that we have a tight loop that fetches
descriptors, which is good for cache utilization.
This will also allow all kind of batching tricks -
e.g. it seems possible to keep SMAP disabled while
we are fetching multiple descriptors.

And perhaps more importantly, this is a very good fit for the packed
ring layout, where we get and put descriptors in order.

This patchset seems to already perform exactly the same as the original
code already based on a microbenchmark.  More testing would be very much
appreciated.

Biggest TODO before this first step is ready to go in is to
batch indirect descriptors as well.

Integrating into vhost-net is basically
s/vhost_get_vq_desc/vhost_get_vq_desc_batch/ -
or add a module parameter like I did in the test module.



Michael S. Tsirkin (2):
  vhost: option to fetch descriptors through an independent struct
  vhost: batching fetches

 drivers/vhost/test.c  |  19 ++-
 drivers/vhost/vhost.c | 333 +++++++++++++++++++++++++++++++++++++++++-
 drivers/vhost/vhost.h |  20 ++-
 3 files changed, 365 insertions(+), 7 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
