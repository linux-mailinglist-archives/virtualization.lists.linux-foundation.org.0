Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F714DDAD
	for <lists.virtualization@lfdr.de>; Thu, 30 Jan 2020 16:20:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5204E20400;
	Thu, 30 Jan 2020 15:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYZxJ4RWL0uE; Thu, 30 Jan 2020 15:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 66B712035B;
	Thu, 30 Jan 2020 15:20:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53C39C0171;
	Thu, 30 Jan 2020 15:20:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF5EC0171
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52EB28841F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzXIx9hJUGpb
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:20:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2976F88364
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580397625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+HkKeJu29lkbPQdm0lI4b+zjMUSQFJM+X+xb9CcAhY=;
 b=Z7BmL7t3g708wLBX1a5D/oLRfq+GQO58QV3sdDbXBZzW6yNgXL5mnm5YZPg2J3T9yz2QD8
 fpbL3lc5qcO5/qg4xwKMDD0G2MiwfKudcsnaJxJaMqQyAgfaCqG+XCa5YGr+Cf6d9HaMNs
 jhGUrAkWaMub+nwl4Gp33RvOHqCJTJw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-S3k7aIXNOhuIdMJ7bdEf2w-1; Thu, 30 Jan 2020 10:20:22 -0500
Received: by mail-qk1-f198.google.com with SMTP id f22so2114754qka.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 07:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=la3GHA8M1dPMBzf5EtBXkrQ0aslvqY4b2xiAgn9DNVw=;
 b=dI9fTqfIv4jYPvN1iYKAjWZwZhXNRuT3HBr9gOOD6gnuP8lvEO36o+x4mKrGtIwh0u
 Ptf4rQ+8yeaCEeNfE1eMZQKJyQ6Tw3RNJn2Fe8SVvN9DKZhxBDgKHaaygTBEIXmSmNZ3
 tKDQdbSG1cPsJHDxP4FzRIbJrkQ/VjNR/gJTLnXnXiJqBObHtqwUKYbf6Z4axege6+uQ
 NrzsCJN8iS20lY+Vj7oSUwFS4An4e24vYHABIj/380djZaZByGqQUlee8OI/uMdFs8FQ
 rTJkJe0ar9ToBtYcZP8tyZ8P/OvtBma7AOu44vTO69bgRdZI4D52tNxEc3CGPBKzc5iM
 hoZA==
X-Gm-Message-State: APjAAAXwl7hFqMvo7sAInn73Ob3WervS0qmH2GG3W62FiH/tVvYVlq84
 rVIyI3XaIqJg6o8e8iiSc51JoFAVl7t6E0HVYrCCiKoUkjrlwoaOxqoUw5j5eTRMCpwS4+T55Jb
 g1Thm2hro8zF5+yxcy8/gy/zUIRdYaCab2NcQvVaOBw==
X-Received: by 2002:ac8:6e83:: with SMTP id c3mr5457800qtv.346.1580397622400; 
 Thu, 30 Jan 2020 07:20:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqynCGgwDYzo/1lIuI49GtkxI2vA5iqze8qOR8lxw2JhiVKjUL8Oyy3cMY8ClJfX00HXBUZcMw==
X-Received: by 2002:ac8:6e83:: with SMTP id c3mr5457768qtv.346.1580397622115; 
 Thu, 30 Jan 2020 07:20:22 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id r185sm2945434qke.102.2020.01.30.07.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 07:20:21 -0800 (PST)
Date: Thu, 30 Jan 2020 10:20:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200130101710-mutt-send-email-mst@kernel.org>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
MIME-Version: 1.0
In-Reply-To: <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
X-MC-Unique: S3k7aIXNOhuIdMJ7bdEf2w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Michal Hocko <mhocko@kernel.org>, Tyler Sanderson <tysand@google.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Jan 30, 2020 at 04:02:34PM +0100, David Hildenbrand wrote:
> On 29.01.20 20:11, Tyler Sanderson wrote:
> > =

> > =

> > On Wed, Jan 29, 2020 at 2:31 AM David Hildenbrand <david@redhat.com
> > <mailto:david@redhat.com>> wrote:
> > =

> >     On 29.01.20 01:22, Tyler Sanderson via Virtualization wrote:
> >     > A primary advantage of virtio balloon over other=C2=A0memory recl=
aim
> >     > mechanisms is that it can=C2=A0pressure the guest's page cache in=
to
> >     shrinking.
> >     >
> >     > However, since the balloon driver changed to using the shrinker A=
PI
> >     >
> >     <https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa=
9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9>=C2=A0this
> >     > use case has become a bit more tricky. I'm wondering what the int=
ended
> >     > device implementation is.
> >     >
> >     > When inflating the balloon against page cache (i.e. no free memory
> >     > remains) vmscan.c will both shrink page cache, but also invoke the
> >     > shrinkers -- including the balloon's shrinker. So the balloon dri=
ver
> >     > allocates memory which requires reclaim, vmscan gets this memory =
by
> >     > shrinking the balloon, and then the driver adds the memory back t=
o the
> >     > balloon. Basically a busy no-op.
> >     >
> >     > If file IO is ongoing during this balloon inflation then the page
> >     cache
> >     > could be growing which further puts "back pressure" on the balloon
> >     > trying to inflate. In testing I've seen periods of > 45 seconds w=
here
> >     > balloon inflation makes no net forward progress.
> >     >
> >     > This wasn't a problem before the change to the shrinker API since
> >     forced
> >     > balloon deflation only occurred via the OOM notifier callback
> >     which was
> >     > invoked only after the page cache had depleted.
> >     >
> >     > Is this new busy behavior working as intended?
> > =

> >     Please note that the shrinker will only be registered in case we ha=
ve
> >     VIRTIO_BALLOON_F_DEFLATE_ON_OOM - (which is AFAIK very rare) - to
> >     implement automatic balloon deflation when the guest is under memory
> >     pressure.
> > =

> > =

> >     Are you actually experiencing issues with that or did you just stum=
ble
> >     over the code?
> > =

> > =

> > We have a use case that is encountering this (and that registers
> > DEFLATE_ON_OOM). We can work around this, but it does seem inefficient.
> > I understand there were good reasons for moving away from the OOM
> > notifier callback, but I'm wondering if the balloon driver could specify
> > a "nice" level to the shrinker API that would cause it to be reclaimed
> > from only as a last resort?
> > =C2=A0
> =

> Cc-ing linux-mm, Michal and Michael.


Interesting.  VIRTIO_BALLOON_F_DEFLATE_ON_OOM is really
underspecified in a bunch of ways.

I'll wait to see what does Michal say from Linux POV.





> Just wondering, how does your workaround look like?
> =

> -- =

> Thanks,
> =

> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
