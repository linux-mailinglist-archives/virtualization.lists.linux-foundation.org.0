Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD888CDB
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 21:12:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4C14ACD;
	Sat, 10 Aug 2019 19:12:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 77DF62C
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 19:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B1A07D2
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 19:12:18 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z16so4424580qka.1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 12:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=tOm/MfXC722ZZDGZkYyy/bxra5b24Gt/HS1+G7EfviI=;
	b=AgIW6v4BrB//Pn/z8uqsQgxb6v2CXT/2pnx5W+JpA1P2jxHCLSO9jKvfKJ32Q4x3DD
	V32Gd6C5SKrPYy25VQ5Wdf5Bp2PQwK/dJeKiXVAfXtZo94lhXG/XRTSKQNP4uO28yMOI
	LMMKQZILeKSrWQDhXxVljnIf+cID8sS8vrpS3wCXzALZ8PiiA2b429MLnieRfej32qkk
	R5kqi8o71WZo9xJIF6QyKHu6tTs5KICDh9yBIOKgh7uSunaI7kjZcDJf+MMtnZVQLILY
	qSbQV7/8mT2g9ubVGsyseq/ZSHyRCdLWYourOALm/BYpRjWV7dXOyw5oJa6/dSpuSy+l
	P2ZQ==
X-Gm-Message-State: APjAAAVMGo8gTLRvqIlfhqZgeYS6Oo4X8oT9pnNSgiKJ+B2FOO+iNpVb
	1dqmetkyRLI+EbdZ63z8vfmBEA==
X-Google-Smtp-Source: APXvYqy9zmxhh9QafC0RnwL+m0pBIJpGi6lXzl9adS3Ij5sGenWXNRYs/XzZWBUSfehxs1JFSId7lA==
X-Received: by 2002:a37:516:: with SMTP id 22mr23794866qkf.308.1565464338086; 
	Sat, 10 Aug 2019 12:12:18 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	q17sm40074395qtl.13.2019.08.10.12.12.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 12:12:16 -0700 (PDT)
Date: Sat, 10 Aug 2019 15:12:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190810150611-mutt-send-email-mst@kernel.org>
References: <20190807070617.23716-1-jasowang@redhat.com>
	<20190807070617.23716-8-jasowang@redhat.com>
	<20190807120738.GB1557@ziepe.ca>
	<ba5f375f-435a-91fd-7fca-bfab0915594b@redhat.com>
	<1000f8a3-19a9-0383-61e5-ba08ddc9fcba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1000f8a3-19a9-0383-61e5-ba08ddc9fcba@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Aug 08, 2019 at 08:54:54PM +0800, Jason Wang wrote:
> I don't have any objection to convert=A0 to spinlock() but just want to
> know if any case that the above smp_mb() + counter looks good to you?

So how about we try this:
- revert the original patch for this release
- new safe patch with a spinlock for the next release
- whatever improvements we can come up with on top

Thoughts?

Because I think this needs much more scrutiny than we can
give an incremental patch.

-- =

MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
