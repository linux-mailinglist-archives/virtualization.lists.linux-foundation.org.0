Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586AD522F
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 21:30:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2BBF11F53;
	Sat, 12 Oct 2019 19:30:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 065631F20
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A9446D0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:18:51 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5DD3C058CA4
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:18:50 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id b67so12708774qkc.1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 12:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=XSSfcNJSuQK6tbBIRVqD8nyyhs8/n5qs+oek7V16gWg=;
	b=Fs16MR5H09jQ93SVWl62L+d3HYpMmxyxsei7LYgDa9TfNJOdds+441xyUqlR3IKbhf
	I17dYs0Ndki1BM3GSEgIgyR6ZIt6J0cRhQPgXolRQBgA0j8QEqvrKvAYq74BmFD9zYH4
	ZXBXXmTId9blol8dFilAtmfuQPSKbYo3W1955QNwN1eW39pGhRlWOQ2J6rgjYUQbeuWc
	WAUSxLYsmIoMM6Shulhqi8qlKrqtZ7iCPJ+akCC3W4ljZaEG7IJkYht75sgkLCviu2oA
	vuGj2UVWfgXJN+MRZgAofSYPJihLJ41vOSQ1qobY5zW8iJiFQUIYoiZQEz+7ryRGPFuC
	yLMQ==
X-Gm-Message-State: APjAAAVlvnYcCGEFBGGN7nNhzBXnjEvlj7IOYh1adQJQNxOJ/5vuhc6L
	kL5c22aMyit3whfcA/Swo3LLbIpHMzznpcFHnHvdKuAznqZkf5bGc85rhbvtczdwaWxLVbuFDwL
	8FirZeQ2Ie5i2IBsELSZx/RMn/g+t7f5I/EBrR9Sktw==
X-Received: by 2002:a37:b8f:: with SMTP id 137mr21665701qkl.466.1570907930052; 
	Sat, 12 Oct 2019 12:18:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYVcRWvZEcwbiX5JXr6fNk4W01ojqCtNq7uXnEznHUo/iukXYBpKClYnD6en9lTNPNSsx0Ow==
X-Received: by 2002:a37:b8f:: with SMTP id 137mr21665681qkl.466.1570907929802; 
	Sat, 12 Oct 2019 12:18:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	x55sm7350774qta.74.2019.10.12.12.18.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 12:18:48 -0700 (PDT)
Date: Sat, 12 Oct 2019 15:18:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 0/2] vhost: ring format independence
Message-ID: <20191012191820.8050-1-mst@redhat.com>
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
More testing would be very much appreciated.

Biggest TODO before this first step is ready to go in is to
batch indirect descriptors as well.

Integrating into vhost-net is basically
s/vhost_get_vq_desc/vhost_get_vq_desc_batch/ -
or add a module parameter like I did in the test module.


Changes from v1:
	- typo fixes

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
