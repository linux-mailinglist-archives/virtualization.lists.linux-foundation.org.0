Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEEB160331
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 10:46:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B92987766;
	Sun, 16 Feb 2020 09:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCT+miYRXEeT; Sun, 16 Feb 2020 09:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAFAB8777C;
	Sun, 16 Feb 2020 09:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86188C013E;
	Sun, 16 Feb 2020 09:46:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6BE6C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A2D318777C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDEbE-w15nkX
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:46:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 984D687766
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581846380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noScbgaCkZMx7Fw4Ys3lLKQbwx2ehnbJ375bYYlmYnU=;
 b=iygYX9SjAhlc0gf6JVgoOOF55oJkuQfL0Kr3y8nWQbxu+KmozQCelncTrDCtd8/0yOhiym
 skSeC9MfPd+wZSazj7HLR1dyaSD8zM2hJvH46K5U4bCVQxEs4EQtI+3IRI5d6xKkXGqlaa
 Whou2HQ7MrEIOY31MaEycboilEAMhLE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-myCrnlAZPXqNKSQkFOgwlQ-1; Sun, 16 Feb 2020 04:46:18 -0500
Received: by mail-wr1-f69.google.com with SMTP id 90so7049492wrq.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 01:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZtasoyQFCb5RWLLV8eTtZLdqEWZ7911rlj1gtV4FhTo=;
 b=RHqfdvE1VVfGmmvHirp6hSmRPLwHHmuWpBjnAkHlfXva6nQXbC/8UEwNY9PJb8cbQ2
 NgfSUq5xoqi0fMrNXlVqA57163wFl+aj2wBhOllrNTl85SDB/FuxcNHuZIhb7TAkDp8u
 Cqr3XOKtvwHOk9jug+iLUai+UlcvJqRVGTjz+sYSonZ4ZV8BxxOIH/ghP3Ibw2BD92bQ
 7EmZKAyopLmngj+9FQzpPOav/jSw0F8/Dm0Tw1Ap+wYYCOsker3hB5I8rhJd3XLhVqjY
 MJA/0l9EJJvap4+WdrfpCxI0r/9vZQq2fQw2C6MkoLzFJ7YMlSglmTDVTK7xU4z17iOX
 MbTA==
X-Gm-Message-State: APjAAAWC6yFRuII1JAJRTIzyIYxve7o+3+S3l2QEhwP9HZQ/0SlRtvrT
 i3mPmS42V9yTM6XuFqvwmYwejwsRw9KI0NVsDHHztfQTDQQcnyvj5DqNVRzKnuPS4kdRN3+XHZB
 txebOvGcRKgTIKMJaf9jN1kbiRptjrJsFUha07JQBsA==
X-Received: by 2002:a05:600c:2406:: with SMTP id
 6mr15804475wmp.30.1581846376893; 
 Sun, 16 Feb 2020 01:46:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiJrJeE35F57XE7BYaxi/pj3GggCLXzH7A0bPaUDDuXSCX0jIpgP45E++A8xFP+UtWDibEKA==
X-Received: by 2002:a05:600c:2406:: with SMTP id
 6mr15804448wmp.30.1581846376650; 
 Sun, 16 Feb 2020 01:46:16 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 o15sm15619180wra.83.2020.02.16.01.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 01:46:15 -0800 (PST)
Date: Sun, 16 Feb 2020 04:46:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200216044551-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <20200214140641.GB31689@dhcp22.suse.cz>
 <802f93b1-1588-bd2c-8238-c12ec7f7ae9e@redhat.com>
 <CAJuQAmpGKcyWo8Ojnia_pXZAaOt98u0c_Sk-8ieCO218hutW1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuQAmpGKcyWo8Ojnia_pXZAaOt98u0c_Sk-8ieCO218hutW1g@mail.gmail.com>
X-MC-Unique: myCrnlAZPXqNKSQkFOgwlQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
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

On Fri, Feb 14, 2020 at 12:48:42PM -0800, Tyler Sanderson wrote:
> Regarding Wei's patch that modifies the shrinker implementation, versus t=
his
> patch which reverts to OOM notifier:
> I am in favor of both patches. But I do want to make sure a fix gets back
> ported to 4.19 where the performance regression was first introduced.
> My concern with reverting to the OOM notifier is, as mst@ put it (in the =
other
> thread):
> "when linux hits OOM=C2=A0all kind of error paths are being hit, latent b=
ugs start
> triggering,=C2=A0latency goes up drastically."
> The guest could be in a lot of pain before the OOM notifier is invoked, a=
nd it
> seems like the shrinker API might allow more fine grained control of when=
 we
> deflate.
> =

> On the other hand, I'm not totally convinced that Wei's patch is an expec=
ted
> use of the shrinker/page-cache APIs, and maybe it is fragile. Needs more
> testing=C2=A0and scrutiny.
> =

> It seems to me like the shrinker API is the right API in the long run, pe=
rhaps
> with some fixes and modifications. But maybe reverting to OOM notifier is=
 the
> best patch to back port?

In that case can I see some Tested-by reports pls?


> On Fri, Feb 14, 2020 at 6:19 AM David Hildenbrand <david@redhat.com> wrot=
e:
> =

>     >> There was a report that this results in undesired side effects when
>     >> inflating the balloon to shrink the page cache. [1]
>     >>=C2=A0 =C2=A0 =C2=A0 "When inflating the balloon against page cache=
 (i.e. no free memory
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0remains) vmscan.c will both shrink page =
cache, but also invoke the
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0shrinkers -- including the balloon's shr=
inker. So the balloon
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0driver allocates memory which requires r=
eclaim, vmscan gets this
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0memory by shrinking the balloon, and the=
n the driver adds the
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0memory back to the balloon. Basically a =
busy no-op."
>     >>
>     >> The name "deflate on OOM" makes it pretty clear when deflation sho=
uld
>     >> happen - after other approaches to reclaim memory failed, not while
>     >> reclaiming. This allows to minimize the footprint of a guest - mem=
ory
>     >> will only be taken out of the balloon when really needed.
>     >>
>     >> Especially, a drop_slab() will result in the whole balloon getting
>     >> deflated - undesired.
>     >
>     > Could you explain why some more? drop_caches shouldn't be really us=
ed in
>     > any production workloads and if somebody really wants all the cache=
 to
>     > be dropped then why is balloon any different?
>     >
> =

>     Deflation should happen when the guest is out of memory, not when
>     somebody thinks it's time to reclaim some memory. That's what the
>     feature promised from the beginning: Only give the guest more memory =
in
>     case it *really* needs more memory.
> =

>     Deflate on oom, not deflate on reclaim/memory pressure. (that's what =
the
>     report was all about)
> =

>     A priority for shrinkers might be a step into the right direction.
> =

>     --
>     Thanks,
> =

>     David / dhildenb
> =

> =


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
