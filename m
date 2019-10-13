Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B5408D5547
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 10:18:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 54A222291;
	Sun, 13 Oct 2019 08:18:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1118521F9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 08:08:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AEC9814D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 08:07:59 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16DF3C049E12
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 08:07:59 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id 59so14526693qtc.5
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 01:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=yhYWl1Umy/1VTjIbbiNd2BN64NH6epCZE/mb8RSLaXM=;
	b=gAu4JxREFdtO0EvluBrqaXrLPBpaCkg2JhDo6Kw39SU4ihux0HfMJfCh+r4CJyGz4N
	YlJUyvUAH0Jw93Lv8PaJ2UeffL5hng7u4SJUHOIYHjxaEoGssi3aZEYCiidNbdqtFn02
	i0kRgQ7XnoiZgh5HK6Osxun38d32+dPWLq5pZ+l9i/3Lz4/t/4LnwuGIWFitVxkeHhEg
	Jnkt6OmkWnny7pAUOV/FoEkn/0XnUDhAOCjLpVnwOk+pjalBJlUoOcZgxsk5DpfavNdM
	wzNbRXxK/QKWhj+bL6MJHvOiQAbR4xSpyXc/u4vVJ1n7cp5qEGite8HqEaEjb+zsJlbg
	UgwA==
X-Gm-Message-State: APjAAAVoqFtZCOIHRuoKHj6yYwEuUfU88ZiMKybhdv9PRlYqvr10LS2N
	2ouCGGl8lFY3txVB/moYSo8gaxlHfq5uLYXPGjpYbM5Gk3W2/zqfsNPV01fgEvMmGjO0etCkOEr
	YIY8zDrb9vsXJBVgsnTY0OYNAzoG0PqyNTp1dCCbMzg==
X-Received: by 2002:a37:9a05:: with SMTP id c5mr23746935qke.98.1570954078376; 
	Sun, 13 Oct 2019 01:07:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdHllinWFJ1shL2L0dscS9heDbinJBHlNcirUbgmYpZ/ksUyJvF3jXeQkMuv9YmookTDp0DQ==
X-Received: by 2002:a37:9a05:: with SMTP id c5mr23746919qke.98.1570954078076; 
	Sun, 13 Oct 2019 01:07:58 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	q8sm7301621qtj.76.2019.10.13.01.07.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 01:07:57 -0700 (PDT)
Date: Sun, 13 Oct 2019 04:07:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 0/4] vhost: ring format independence
Message-ID: <20191013080742.16211-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

This adds infrastructure required for supporting
multiple ring formats.

The idea is as follows: we convert descriptors to an
independent format first, and process that converting to
iov later.

The point is that we have a tight loop that fetches
descriptors, which is good for cache utilization.
This will also allow all kind of batching tricks -
e.g. it seems possible to keep SMAP disabled while
we are fetching multiple descriptors.

This seems to perform exactly the same as the original
code already based on a microbenchmark.
Lightly tested.
More testing would be very much appreciated.

To use new code:
	echo 1 > /sys/module/vhost_test/parameters/newcode
or
	echo 1 > /sys/module/vhost_net/parameters/newcode

Changes from v2:
	- fixed indirect descriptor batching

Changes from v1:
	- typo fixes


Michael S. Tsirkin (4):
  vhost: option to fetch descriptors through an independent struct
  vhost/test: add an option to test new code
  vhost: batching fetches
  vhost/net: add an option to test new code

 drivers/vhost/net.c   |  32 +++-
 drivers/vhost/test.c  |  19 ++-
 drivers/vhost/vhost.c | 340 +++++++++++++++++++++++++++++++++++++++++-
 drivers/vhost/vhost.h |  20 ++-
 4 files changed, 397 insertions(+), 14 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
