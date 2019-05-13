Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 906391BC49
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 19:52:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C10D5F29;
	Mon, 13 May 2019 17:52:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50841E7F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 17:52:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A7AEC42D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 17:52:51 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a132so10042890oib.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y9X01Pkq0XXte5z0O4rYu6NU6lcDo0STfPmFKCJpwI4=;
	b=MeRY+QdGFjfDKUSuf7dAOysOfrk9IX/j0cXEQeRSHYHXItna9fFtGcb80/8yDKWYkg
	kEPTsia824fjKznGv99pekCCmDAbBmu8zC8ES2wNtrw9iGNZzpMC40Dc0waTtukABlou
	DiMjy3wekDMZv+rEku5zj5N9lua8h+E9NR26CrKLNtsmzHWBp5Dk25a7+ZFTFlXvp5bn
	CKgC360dEZCMTiYCVvVNHBz83ANXriwcLt3Kp71GNpJ+aE+ylpXoUdrY8187QZo8pUjo
	MSFx+LZTKoW3yj60OEeZpgD+/UaXJIXSDimXFG17gPEeJljKEDt4VY/2RYHjnGTmH4Sh
	vvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y9X01Pkq0XXte5z0O4rYu6NU6lcDo0STfPmFKCJpwI4=;
	b=mf0/e5jnMBBJXRci6I7A2oEA4qKdV2YwYq1iTPVui5e0j7IjDMOvg0DdjrKzAxN5Xl
	mk5/6f7kJ+/ShyiqX2awv8SMxkPBN2dA8vkTQ0lxIqa4B7pLSPKB3KibmBW9UW8WoQXh
	LB75AV0qPryeM+DETXU8Ogp3kNtb5IeC+ztKpNcU2WkUkOLga0CbZqRn7+cmvA3KPNL2
	AiyO8iMr70UUIEzWianaPRze6ZB9grCsOWPQ4365oXdOzz3ineARymEyKZBTwoBUVrP3
	EDYZ+rPn6IdccSrC9pi5ngBUhAb24pdcdx16kE4+drVo9z67L0se4PjSxZqeyTCXDR2s
	Zrtw==
X-Gm-Message-State: APjAAAVQ8+AqBoWN+mnsEObHY6dfJF6hOtVKtLZnirXwplxRxH7ld3tk
	PZ1hxI6InEswUxZEDrgYsoEH4COFcwfvxEbfpXVCgw==
X-Google-Smtp-Source: APXvYqyHlb4HK4pDjcMSgSQt8NqfXMPz+kR7QQEkSBVnAow9XkYo/o3V5df/EMWF1DvMzRr9ptTlw2tfnEJV3YCdJtY=
X-Received: by 2002:aca:dfc4:: with SMTP id w187mr254128oig.70.1557769970924; 
	Mon, 13 May 2019 10:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190510155202.14737-1-pagupta@redhat.com>
	<20190510155202.14737-4-pagupta@redhat.com>
	<CAPcyv4hbVNRFSyS2CTbmO88uhnbeH4eiukAng2cxgbDzLfizwg@mail.gmail.com>
	<864186878.28040999.1557535549792.JavaMail.zimbra@redhat.com>
	<CAPcyv4gL3ODfOr52Ztgq7BM4gVf1cih6cj0271gcpVvpi9aFSA@mail.gmail.com>
	<2003480558.28042237.1557537797923.JavaMail.zimbra@redhat.com>
	<116369545.28425569.1557768748009.JavaMail.zimbra@redhat.com>
In-Reply-To: <116369545.28425569.1557768748009.JavaMail.zimbra@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 13 May 2019 10:52:39 -0700
Message-ID: <CAPcyv4genJtCt6dp6N07_6RfPTwC6xXMhLp-dr0GWQy5q52YoA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v8 3/6] libnvdimm: add dax_dev sync flag
To: Pankaj Gupta <pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>, jstaron@google.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, Adam Borowski <kilobyte@angband.pl>,
	Rik van Riel <riel@surriel.com>, yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>, cohuck@redhat.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>
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

On Mon, May 13, 2019 at 10:32 AM Pankaj Gupta <pagupta@redhat.com> wrote:
>
>
> Hi Dan,
>
> While testing device mapper with DAX, I faced a bug with the commit:
>
> commit ad428cdb525a97d15c0349fdc80f3d58befb50df
> Author: Dan Williams <dan.j.williams@intel.com>
> Date:   Wed Feb 20 21:12:50 2019 -0800
>
> When I reverted the condition to old code[1] it worked for me. I
> am thinking when we map two different devices (e.g with device mapper), will
> start & end pfn still point to same pgmap? Or there is something else which
> I am missing here.
>
> Note: I tested only EXT4.
>
> [1]
>
> -               if (pgmap && pgmap->type == MEMORY_DEVICE_FS_DAX)
> +               end_pgmap = get_dev_pagemap(pfn_t_to_pfn(end_pfn), NULL);
> +               if (pgmap && pgmap == end_pgmap && pgmap->type == MEMORY_DEVICE_FS_DAX
> +                               && pfn_t_to_page(pfn)->pgmap == pgmap
> +                               && pfn_t_to_page(end_pfn)->pgmap == pgmap
> +                               && pfn_t_to_pfn(pfn) == PHYS_PFN(__pa(kaddr))
> +                               && pfn_t_to_pfn(end_pfn) == PHYS_PFN(__pa(end_kaddr)))

Ugh, yes, device-mapper continues to be an awkward fit for dax (or
vice versa). We would either need a way to have a multi-level pfn to
pagemap lookup for composite devices, or a way to discern that even
though the pagemap is different that the result is still valid / not
an indication that we have leaked into an unassociated address range.
Perhaps a per-daxdev callback for ->dax_supported() so that
device-mapper internals can be used for this validation.

We need to get that fixed up, but I don't see it as a blocker /
pre-requisite for virtio-pmem.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
