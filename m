Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 620161AD60F
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 08:28:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A91D486214;
	Fri, 17 Apr 2020 06:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Anlb5yRYJhei; Fri, 17 Apr 2020 06:28:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25FD086169;
	Fri, 17 Apr 2020 06:28:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0570EC0172;
	Fri, 17 Apr 2020 06:28:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7D29C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9D15E860C1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnxkfh-Ss94N
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:28:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E0BC385E2B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587104917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcCel47F4+/8/EXpsMymPAFzEr6bIiKRgpBzcGoaMj8=;
 b=dC8kLWOJ/cIv8JujmqAge3t+sIrE/xmpnmsnHfBKnUnaJhCYhM97OE0SHkpq6O5RPHwyot
 seM76eCau8XXumRpZE3w96ERVwhACResWaJ6crXfF+o+etJxtukcw50UXbdZJ0iw2U+rm1
 JpC3dqCTMEkCFO4PZMhIccVH7nbNTAo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-Lb_9e7COMhqo-A-ZRHleCg-1; Fri, 17 Apr 2020 02:28:34 -0400
X-MC-Unique: Lb_9e7COMhqo-A-ZRHleCg-1
Received: by mail-wm1-f70.google.com with SMTP id h184so543325wmf.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 23:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UcCel47F4+/8/EXpsMymPAFzEr6bIiKRgpBzcGoaMj8=;
 b=DKfqwANMQPuvttoFA7UadwtmpAMrl8gU2bPjxwLQZxuh0P4BbyD8w/dkt+dK7T2sIt
 9wCF9z3Lmp12S//8SEt7tzr5SiGtlvcwKQzjkYz/vJMIkjUtXmRgfUA84ApqvQPM1vpY
 6o/geNIRXefcl3tHc/bulOmQwAlBVzMSVV9LbsctqrnQ7u0T/otGTE85/nUSK4h1TtWJ
 WBqcf8SO0n6WNTfYsCNOYuwzA99IVWOQh/LNef1I27YBjEGhtme9+Ha/fnXLRiIaB8/Q
 /wqaSo0WwSir48ECRbVxLXin/M7ImwZATqiDmj0XzDC8SaOFSRR5zmIhatIeJ1FiA5yW
 Tlog==
X-Gm-Message-State: AGi0Pub9muq8sj0GhbaVe/gzax2JAQh134cL/I8ekVdyDS+t9BgfNpkJ
 gP0KAHK6sLAzbjQIUJmwzBvhgS81LoCRYc1pUdoRUzoUqgmGFu0N4Q/fdnOHIawsTQQqd5HFvif
 NaSN1P7X9mCz4CFpwZUvQRJAkp065vDAtgV3fdFOBwg==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr2297026wrn.423.1587104913488; 
 Thu, 16 Apr 2020 23:28:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypLrZCKxUcg8uVlRSYz7ioeZt23O7dhAtW9wVskoKvtXqOhxkD815GZbpRPDqevnCruNGoJ9FQ==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr2297009wrn.423.1587104913266; 
 Thu, 16 Apr 2020 23:28:33 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id z16sm32584986wrl.0.2020.04.16.23.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 23:28:32 -0700 (PDT)
Date: Fri, 17 Apr 2020 02:28:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417021335-mutt-send-email-mst@kernel.org>
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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

On Thu, Apr 16, 2020 at 04:52:42PM -0700, Alexander Duyck wrote:
> On Thu, Apr 16, 2020 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Apr 16, 2020 at 12:30:38PM -0700, Alexander Duyck wrote:
> > > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > >
> > > If we have free page hinting or page reporting enabled we should disable it
> > > if the pages are poisoned or initialized on free and we cannot notify the
> > > hypervisor.
> > >
> > > Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> > >
> > > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >
> >
> > Why not put this logic in the hypervisor?
> 
> I did that too. This is to cover the case where somebody is running
> the code prior to my QEMU changes where the page poison feature wasn't
> being enabled.


Hmm so that one looks like a QEMU bug (does not expose poison flag).  In
the past we just said need to fix the bug where it's found unless the
issue is very widespread and major.  Let's assume QEMU learns to always
expose POISON with HINT.  Then this configuration (HINT && !POISON)
allows us to detect old QEMU (pre your changes).

I am also interested in the following question:
Is this good for anything? In particular are there any bugs in HINT
we can fix using this hack?

E.g. I know HINT does not obey MUST_TELL_HOST under OOM.  But that
unfortunately is a guest not a host bug, so this hack does not seem
useful.


> > We don't know what hypervisor uses the hints for.
> 
> I agree, but at the same time the way the feature was originally coded
> it was only checked if the FREE_PAGE_HINT feature was enabled. The
> assumption there is that if we have page poison data and want to use
> hints we need to report it. In my mind if we ever want to switch over
> to the page reporting style setup for page hinting in the future we
> will need to have it behave in a sane manner. So disabling it if we
> have a poison value we need to report, but have no mechanism to report
> it makes sense to me.
> 
> The actual likelihood of us encountering this case should be pretty
> low anyway since it is not that common to have page poisoning or
> init_on_free enabled.
> 
> > Yes you can not just drop them but you can maybe do
> > other things such as MADV_SOFT_OFFLINE.
> >
> > Finally, VIRTIO_BALLOON_F_FREE_PAGE_HINT does nothing
> > at all unless guest gets the command from hypervisor,
> > so there isn't even any overhead.
> 
> The problem is we cannot communicate the full situation to the
> hypervisor without the page poison feature being present. As such I
> would worry about that backfiring on us due to the hypervisor acting
> on incomplete data.


I'll try to think about VIRTIO_BALLOON_F_FREE_PAGE_HINT situation
over the weekend. But for the new page reporting, why not
assume host implementation will be sane?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
