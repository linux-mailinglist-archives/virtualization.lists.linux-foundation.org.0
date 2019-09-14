Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC38B2CBE
	for <lists.virtualization@lfdr.de>; Sat, 14 Sep 2019 21:39:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 22C31AF5;
	Sat, 14 Sep 2019 19:39:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0D75A907
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 19:39:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD8AD619
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 19:39:05 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 420C985546
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 19:39:05 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id f19so35938185qtq.1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 12:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=vaylEgrlIg+lPjH544xVFYytAlsLACbCpY321J/9g4E=;
	b=PI2JiSSeHuBEO4aYoQUDtMpbHAEJwMtmeuDsGBjbSb8f5hC8CxkrboP33UxOw/2g9q
	A1RXjn3fvA7RNPKONNp+jqApvAZOt4lfbCln9z44ILovfLWyeeJ+K7Xlp+OVLhmVIkff
	anSslzrhxmcWQH/RPFXgD73kcnwjcjVPqmU0PzIkw2jheEBWDtAm7ppHRfedMIzr8n3u
	f3a9SHGHjS5HQUw5zD41BSiq0OJyg9o6xnl0R0AqtUMvCDgw83nARZUH1BRSfqTBWN23
	0EbCV2Qjy6bxxfm4BZy8hL1CLWkr/FsyHfAtSsF7/lZfmb88pas7QF+8FWSCbUHr8Cl2
	sBNg==
X-Gm-Message-State: APjAAAWIR0fAc4AAV0t+9cv6poHV1Sg7VTdfWJtP0nTs4hZ1zOxZc/cr
	qPcWSeEByFkZfKPtjTV+MzecHb9LvpzaGZoiYEhQe/lODx+NPfR2oFj/ta8pqYR1c7PnsFJ/YTE
	nu9XSE2VcVp+0GjwJ6X7xV5Hk4K4mCLvA5TYLuxd4QA==
X-Received: by 2002:a37:4b97:: with SMTP id
	y145mr53500325qka.310.1568489944597; 
	Sat, 14 Sep 2019 12:39:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwD6rz0Xz1EID/JFGdbYv8ZxwisBunlJJE5csAnnPdoREA9Pde8LY2vagubbz6rBIS1caMDgg==
X-Received: by 2002:a37:4b97:: with SMTP id
	y145mr53500312qka.310.1568489944423; 
	Sat, 14 Sep 2019 12:39:04 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	y17sm17211975qtb.82.2019.09.14.12.39.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 12:39:03 -0700 (PDT)
Date: Sat, 14 Sep 2019 15:38:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: a last minute revert
Message-ID: <20190914153859-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

So I made a mess of it. Sent a pull before making sure it works on 32
bit too. Hope it's not too late to revert. Will teach me to be way more
careful in the near future.

The following changes since commit 060423bfdee3f8bc6e2c1bac97de24d5415e2bc4:

  vhost: make sure log_num < in_num (2019-09-11 15:15:26 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 0d4a3f2abbef73b9e5bb5f12213c275565473588:

  Revert "vhost: block speculation of translated descriptors" (2019-09-14 15:21:51 -0400)

----------------------------------------------------------------
virtio: a last minute revert

32 bit build got broken by the latest defence in depth patch.
Revert and we'll try again in the next cycle.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (1):
      Revert "vhost: block speculation of translated descriptors"

 drivers/vhost/vhost.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
