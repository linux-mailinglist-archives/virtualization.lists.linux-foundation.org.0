Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE3D5669
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 15:49:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 98CBB221C;
	Sun, 13 Oct 2019 13:49:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B8291221D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 13:39:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 427896CE
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 13:39:11 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B224C058CA4
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 13:39:10 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id n135so14230295qke.23
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 06:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=kXBZT+KuCy4M5CNTs9dJ7Gfn83TIs8hw++O0P5w+0dg=;
	b=m0qyKhlpg12KSBk/UF0hddg6JDKd8vRbSEpax4Zx7RAjiZCC4ub6m9U+k/dEp6qlNC
	MVs8j/KXj3VFahwnu6xK2OJUKmK6Mv2gG956WMCCbDAw8NGgz/Ld3MRY3ZBVNeehnVVo
	i5rDABauNqvpU0kcHlf27HZmMST2+aFcP6L6HIUrqRCO4cyzsHV4/ihvLP5q0b7Xnb8X
	ZARLD8SOMc63necD7d7PDJMF8FdtxTCwL4LuSkbHv7nwaWExGa6kmT4UURt7JPzXEdhL
	cyIShd5FUCrUWR6zxcrRVmG/S8CFDCu+qnO5kRe9fW4p2dlJSwOAD+LjiPhuNHx0L0h+
	E3qQ==
X-Gm-Message-State: APjAAAVFmMyYyFUi54Cqje0saup1YDxM+OfOyRX4pD2q+t12tjd1oiHd
	8pwe7xW8iBku+GCIY+qh9cVMn9jgSU6y1ctk43newB0PQq7qbaZBnnwIN5KdUHvnWE9dtLx9+iE
	Wv1XV+hOwbSj41CvBaZLC50hUe/IodROHaAG9OEmPvQ==
X-Received: by 2002:a37:8b03:: with SMTP id n3mr25557171qkd.493.1570973949759; 
	Sun, 13 Oct 2019 06:39:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5WF3wXokXVKUTg2nwOQe8Mt902ONvM0nGoT3IhiJAEnCmxpugGwOSneWWqPK9EJJ85g4ciw==
X-Received: by 2002:a37:8b03:: with SMTP id n3mr25557159qkd.493.1570973949553; 
	Sun, 13 Oct 2019 06:39:09 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	z13sm6416308qkj.34.2019.10.13.06.39.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 06:39:08 -0700 (PDT)
Date: Sun, 13 Oct 2019 09:39:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@web.de>
Subject: Re: [PATCH] tools/virtio: Fix build
Message-ID: <20191013093844-mutt-send-email-mst@kernel.org>
References: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
	<20191013075107-mutt-send-email-mst@kernel.org>
	<08c1e081-765b-7c3a-ed31-2059dc521fd0@web.de>
	<20191013081541-mutt-send-email-mst@kernel.org>
	<eacb6818-fe3e-f983-9946-e172f0077d4b@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eacb6818-fe3e-f983-9946-e172f0077d4b@web.de>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

On Sun, Oct 13, 2019 at 03:29:34PM +0200, Jan Kiszka wrote:
> On 13.10.19 14:20, Michael S. Tsirkin wrote:
> > On Sun, Oct 13, 2019 at 02:01:03PM +0200, Jan Kiszka wrote:
> >> On 13.10.19 13:52, Michael S. Tsirkin wrote:
> >>> On Sun, Oct 13, 2019 at 11:03:30AM +0200, Jan Kiszka wrote:
> >>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>>
> >>>> Various changes in the recent kernel versions broke the build due to
> >>>> missing function and header stubs.
> >>>>
> >>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>>
> >>> Thanks!
> >>> I think it's already fixes in the vhost tree.
> >>> That tree also includes a bugfix for the test.
> >>> Can you pls give it a spin and report?
> >>
> >> Mostly fixed: the xen_domain stup is missing.
> >>
> >> Jan
> >
> > That's in xen/xen.h. Do you still see any build errors?
> 
> ca16cf7b30ca79eeca4d612af121e664ee7d8737 lacks this - forgot to add to
> some commit?
> 
> Jan

Oh, you are right.
Should be fixed now.
Thanks!
-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
