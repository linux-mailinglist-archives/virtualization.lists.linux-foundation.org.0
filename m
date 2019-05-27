Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55C2B835
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 17:16:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0580119ED;
	Mon, 27 May 2019 15:16:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B770B1893
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B32F821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:15:37 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id l73so3912686vkl.8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=S3tITZHYfrewmW5oJlisGGiL7wfHqP1R9OVY9cCC4GU=;
	b=XMXSYZE75UFYyx1xFfgpOaumUUYGcPmyuJkYl8Io6FNzsyP+LivptHomdcpys2tbLQ
	Ll8NMCfl/Vubkt1iG2yZxdtCA3eU8u2UP5rDm/8OJFNRlXcBi5xD4NMae5lXsQF9iyQx
	QE/0Q/lEcgjB9Py1AbWA3hRYms5wWJLa7+hpMMHVUkSVfFg8DlLN8IKMw1RUpp0W6CY7
	HuxlcArItZ6MdXkYF1D3cbAyfPM2TgfIBXCmv7adwLYand8eOsSjdIlITDGjAU9RFi+0
	uafqfgbNcTuwxrkzlGzSPfy9PLD24I8CT9ZdXFg8r3BzKudQKt23wV0sdgxuxADo50Fz
	sWqg==
X-Gm-Message-State: APjAAAWoR7Gv9lvg3fAnIaEAJ7Rw1u7trZ1eq9lx2ZHRKlsAfOVjPPjQ
	Z9ya0PnBSU5I0FWUM4bAptXXbA==
X-Google-Smtp-Source: APXvYqxJCHIEBYM/VufOiGYY7G560g6K/dg4+SJBDDD3dVA0O70dd9ZnwStYxTkM8qVIYrC3jk8P+g==
X-Received: by 2002:a1f:7cc7:: with SMTP id x190mr19173038vkc.92.1558970136480;
	Mon, 27 May 2019 08:15:36 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	w131sm6373477vsw.7.2019.05.27.08.15.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 27 May 2019 08:15:35 -0700 (PDT)
Date: Mon, 27 May 2019 11:15:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v7 0/7] Add virtio-iommu driver
Message-ID: <20190527111345-mutt-send-email-mst@kernel.org>
References: <20190115121959.23763-1-jean-philippe.brucker@arm.com>
	<20190512123022-mutt-send-email-mst@kernel.org>
	<20190527092604.GB21613@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527092604.GB21613@8bytes.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, virtio-dev@lists.oasis-open.org,
	lorenzo.pieralisi@arm.com, tnowicki@caviumnetworks.com,
	devicetree@vger.kernel.org,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	linux-pci@vger.kernel.org, will.deacon@arm.com,
	robin.murphy@arm.com, virtualization@lists.linux-foundation.org,
	eric.auger@redhat.com, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, marc.zyngier@arm.com, bhelgaas@google.com,
	kvmarm@lists.cs.columbia.edu
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

On Mon, May 27, 2019 at 11:26:04AM +0200, Joerg Roedel wrote:
> On Sun, May 12, 2019 at 12:31:59PM -0400, Michael S. Tsirkin wrote:
> > OK this has been in next for a while.
> > 
> > Last time IOMMU maintainers objected. Are objections
> > still in force?
> > 
> > If not could we get acks please?
> 
> No objections against the code, I only hesitated because the Spec was
> not yet official.
> 
> So for the code:
> 
> 	Acked-by: Joerg Roedel <jroedel@suse.de>

Last spec patch had a bunch of comments not yet addressed.
But I do not remember whether comments are just about wording
or about the host/guest interface as well.
Jean-Philippe could you remind me please?

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
