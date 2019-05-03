Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A971344D
	for <lists.virtualization@lfdr.de>; Fri,  3 May 2019 22:06:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9A40D3C22;
	Fri,  3 May 2019 20:05:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 127333C10
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 20:04:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 92F2379
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 20:04:52 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id m32so5075599qtf.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 03 May 2019 13:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=9X9Yn//uNc4nUt79TMtyqufL6vACayUvlMnGmpMumpM=;
	b=qh81UISgRvoZuoBxZDCVrusvm3YOsBdh5XLyxPUwbfuw+LRrLl4vLuQVbGYQ4jjtuu
	WJqiv7L4kU3pyiX7rsGHqMPTU1gSVUCawF5i82VVT6fVBwUxsil5r5czQ2zFUiC9uUCY
	oDwG2zzX9KBrSbwEMrvVRfFaEClBd5FN6CSppjKK8yLabAOkDvPFhrjseB0/RxS3Vydo
	NnPmmhSiO1Bo3cfrgNIKiqOZkTGbUx45McnYqC6Y32DeFLRuXTziUn991fevg3Ux/Prc
	MQI12+d+rDtuqkGPRmNPLs/m8FQKy1ML7EhWUEHQP1EwtJIPmejwGl5siwsGfHKdew5C
	GAmw==
X-Gm-Message-State: APjAAAVr4UggvBTfKPvJRZ7d2SZokWkSoU3bH8lrVNEDzOwnkj5FBq+m
	7bQ4M1Y5udrL45KuV9G5J6f5bQ==
X-Google-Smtp-Source: APXvYqxJqgC9JI6r+i5mLL7IPh0JnKywe0jyA2dWegR16gGx/T8GcVix3ycZOigW7QFKPasTYegZZA==
X-Received: by 2002:a0c:d928:: with SMTP id p37mr9920668qvj.45.1556913891689; 
	Fri, 03 May 2019 13:04:51 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	e131sm1882716qkb.80.2019.05.03.13.04.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 03 May 2019 13:04:50 -0700 (PDT)
Date: Fri, 3 May 2019 16:04:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 01/10] virtio/s390: use vring_create_virtqueue
Message-ID: <20190503160421-mutt-send-email-mst@kernel.org>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-2-pasic@linux.ibm.com>
	<20190503111724.70c6ec37.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503111724.70c6ec37.cohuck@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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

On Fri, May 03, 2019 at 11:17:24AM +0200, Cornelia Huck wrote:
> On Fri, 26 Apr 2019 20:32:36 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > The commit 2a2d1382fe9d ("virtio: Add improved queue allocation API")
> > establishes a new way of allocating virtqueues (as a part of the effort
> > that taught DMA to virtio rings).
> > 
> > In the future we will want virtio-ccw to use the DMA API as well.
> > 
> > Let us switch from the legacy method of allocating virtqueues to
> > vring_create_virtqueue() as the first step into that direction.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > ---
> >  drivers/s390/virtio/virtio_ccw.c | 30 +++++++++++-------------------
> >  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> I'd vote for merging this patch right away for 5.2.

So which tree is this going through? mine?

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
