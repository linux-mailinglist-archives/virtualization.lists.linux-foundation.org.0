Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 255061310D9
	for <lists.virtualization@lfdr.de>; Mon,  6 Jan 2020 11:51:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DE7184BBE;
	Mon,  6 Jan 2020 10:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clltE4YGT6PZ; Mon,  6 Jan 2020 10:51:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D377785198;
	Mon,  6 Jan 2020 10:51:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE236C0881;
	Mon,  6 Jan 2020 10:51:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4923C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 10:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B3969876A0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 10:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBTEfMOjJm7s
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 10:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CDBF687702
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578307843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qU0SboNEBDWBERvxqixCdqMTzHYQoyobKNvA/+6rjvk=;
 b=VXKO1yeA8hbAJUwgWeRvslKBPgWi1pvIHLW6eUh86SIMo3a5WM1SOd9VKQNoQGXHJehyiu
 fA7DWFtuWfx2yCkJGGv+l/8iMNBITNt4ATze+XQyttF7EqU7gM+YAG+yPQpY1m2/jTo2Sa
 sYa87e4wt+0bsb2HNmaOtdzpnSbTWyQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-o4VUwQPwN5mLOjYj_rrhVg-1; Mon, 06 Jan 2020 05:50:42 -0500
Received: by mail-qk1-f199.google.com with SMTP id l7so14619290qke.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Jan 2020 02:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qU0SboNEBDWBERvxqixCdqMTzHYQoyobKNvA/+6rjvk=;
 b=WKH8a8URUdxSEh3lkNmwaeKzLkBhIJOimnW1QPtV3pk3o4cYz2MiNwf1BPuggqs9Mm
 fajiofjxeu2brGr4hAk73JQw8TikDURVpI9wLT4Cvle8wUUpSB59n/saxErfa+5YdkL2
 D9pviqY/PWI0HS25gjj3NyWonjuSLo1Fbvez0j/rD4FJJCBzs+6VEX6y7BSWWYWr0qV7
 GzqWh4H250NHFiXFIqYlC0UzHG4zXabIWAZ8Xch0yXxdlq2FyQeYb0YJzeH9q7FtUU16
 vLVWEDl0pHuD5E0vqbfjT+KbgnqQfYx5DtJBoOdo8VuZ9mq64+g3yUqhwjcfIRtNlN5n
 HG6A==
X-Gm-Message-State: APjAAAWYKlD+1nqMprE6J8GzIwvEr5GFmaXfYLZlXCKkBU1V/6xYwURz
 dtOzw1Pj7cxpEyHV4D4m99YuR9pybQVNIGnq9SkLNxoVtQVMO02DJ1poIbCseGUpyF2CpzDMV3W
 LxrQHFe4tgk1b/fJ/UZoj1XAfY7aR25FujX3OGrhZdQ==
X-Received: by 2002:a37:65c7:: with SMTP id
 z190mr77575624qkb.261.1578307841385; 
 Mon, 06 Jan 2020 02:50:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBMNWp3jpUCJz4gy7m1LfPpAYW3QX/zbzMI48HgZMdTtTpUk7nhqdKrFjR8fz3UtWCh133Iw==
X-Received: by 2002:a37:65c7:: with SMTP id
 z190mr77575606qkb.261.1578307841125; 
 Mon, 06 Jan 2020 02:50:41 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id e2sm20313422qkb.112.2020.01.06.02.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 02:50:40 -0800 (PST)
Date: Mon, 6 Jan 2020 05:50:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200106054041-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
X-MC-Unique: o4VUwQPwN5mLOjYj_rrhVg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Dec 18, 2019 at 04:59:02PM +0100, Christian Borntraeger wrote:
> On 18.12.19 16:10, Michael S. Tsirkin wrote:
> > On Wed, Dec 18, 2019 at 03:43:43PM +0100, Christian Borntraeger wrote:
> >> Michael,
> >>
> >> with 
> >> commit db7286b100b503ef80612884453bed53d74c9a16 (refs/bisect/skip-db7286b100b503ef80612884453bed53d74c9a16)
> >>     vhost: use batched version by default
> >> plus
> >> commit 6bd262d5eafcdf8cdfae491e2e748e4e434dcda6 (HEAD, refs/bisect/bad)
> >>     Revert "vhost/net: add an option to test new code"
> >> to make things compile (your next tree is not easily bisectable, can you fix that as well?).
> > 
> > I'll try.
> > 
> >>
> >> I get random crashes in my s390 KVM guests after reboot.
> >> Reverting both patches together with commit decd9b8 "vhost: use vhost_desc instead of vhost_log" to
> >> make it compile again) on top of linux-next-1218 makes the problem go away.
> >>
> >> Looks like the batched version is not yet ready for prime time. Can you drop these patches until
> >> we have fixed the issues?
> >>
> >> Christian
> >>
> > 
> > Will do, thanks for letting me know.
> 
> I have confirmed with the initial reporter (internal test team) that <driver name='qemu'/> 
> with a known to be broken linux next kernel also fixes the problem, so it is really the
> vhost changes.

OK I'm back and trying to make it more bisectable.

I pushed a new tag "batch-v2".
It's same code but with this bisect should get more information.


I suspect one of the following:

commit 1414d7ee3d10d2ec2bc4ee652d1d90ec91da1c79
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Mon Oct 7 06:11:18 2019 -0400

    vhost: batching fetches
    
    With this patch applied, new and old code perform identically.
    
    Lots of extra optimizations are now possible, e.g.
    we can fetch multiple heads with copy_from/to_user now.
    We can get rid of maintaining the log array.  Etc etc.
    
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

commit 50297a8480b439efc5f3f23088cb2d90b799acef
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Wed Dec 11 12:19:26 2019 -0500

    vhost: use batched version by default
    
    As testing shows no performance change, switch to that now.
    
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


and would like to know which.

Thanks!


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
