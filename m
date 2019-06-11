Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA13C932
	for <lists.virtualization@lfdr.de>; Tue, 11 Jun 2019 12:44:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F5F9941;
	Tue, 11 Jun 2019 10:44:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A5955941
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 10:44:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3DC9F79
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 10:44:07 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j19so13841884qtr.12
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 03:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+Pnqdbl0zwY2ePurYnw0Hwq65Ie2NI3IHAjinIWbf4k=;
	b=DaIuinrTobgsbfUuvDileSK1N0T3dUXeVWq/urTM8qQsjPe3tzsIcSxu5oUVYsjGpt
	3lfb3pHQIdiZDujV71w8jx8ng1p+sIkgMmxermon75qqPLjEwMLkHJhjToIOFedsXQAe
	v5Hb/l+cuXaOUtqR0SQUb7Lu1jOzGN6/YObHjcSDmubKn+hRxbMcoiE3dGrFcefkjsch
	pLYjG6ft6Va8HjMGRj7fbxKJTp6xGcYJVLxGvrWnQv02SyOtr3RCy81GtcFamtlnsAgk
	u2zdZRwuSize0fX5y+Noo7opSdU9hPbxm7ftNxQsrhlDqpmEmowsaE9F6L+SaQDSgXHk
	yO3g==
X-Gm-Message-State: APjAAAWgNwcOPfUSRBHw/IFDjcJS3GuNIqDurlPDQVSm23nLYUOpRGj7
	05SckD0RZWGnS5XUguFkuvKvOg==
X-Google-Smtp-Source: APXvYqwEjJLHFIDj3ElSvfJnv/+Qf+1oLIRfn+OC5xB0E+z5wCQ/9XPGNXVGVO9OcT8FHNYKICjUMQ==
X-Received: by 2002:ac8:4442:: with SMTP id m2mr41565944qtn.107.1560249846338; 
	Tue, 11 Jun 2019 03:44:06 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	s23sm9036235qtj.56.2019.06.11.03.44.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 03:44:05 -0700 (PDT)
Date: Tue, 11 Jun 2019 06:44:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v4 0/8] s390: virtio: support protected virtualization
Message-ID: <20190611064354-mutt-send-email-mst@kernel.org>
References: <20190606115127.55519-1-pasic@linux.ibm.com>
	<20190611123740.3d46f31b.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611123740.3d46f31b.cohuck@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Jason J. Herne" <jjherne@linux.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
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

On Tue, Jun 11, 2019 at 12:37:40PM +0200, Cornelia Huck wrote:
> On Thu,  6 Jun 2019 13:51:19 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > * Documentation is still very sketchy. I'm committed to improving this,
> >   but I'm currently hampered by some dependencies currently.  
> 
> Have the "dependencies" been resolved in the meantime? It probably
> would be a good idea to include some documentation for what needs to be
> dma and what doesn't somewhere in the kernel documentation (IIRC we
> have a s390 drivers 'book' partially generated from kerneldoc; there's
> some general document about the cio interfaces as well, but I'm not
> sure how up-to-date that is.)
> 
> I think the code in here looks sane from my point of view (except for
> the one easy-to-fix issue I found); I would be fine with the virtio-ccw
> patches making it into the kernel via the s390 tree (and not via the
> virtio tree).

Yes, me too.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
