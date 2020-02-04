Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA1D152189
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 21:34:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3899C85B68;
	Tue,  4 Feb 2020 20:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0V5cVSeIBuG; Tue,  4 Feb 2020 20:34:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C388838D9;
	Tue,  4 Feb 2020 20:34:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEC0EC0174;
	Tue,  4 Feb 2020 20:34:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E97AAC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 20:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF9052076B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 20:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y82yQQScN79u
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 20:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 98CD820764
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580848473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=THAEQOMHoaTiiOPbX7h8DNEEb4f2RS0VVJtOdkMrYnk=;
 b=LbdBHCz3S8XPTaY31pm5atxUfx9fwnAJGPwVFbn3Ns8amyqvuWNiNNc+GbWhpR/AB4uO7K
 DfX5wgjcJUZvZZn5St+4VFpxOBP2wNtyDicPhtqm4OKno2upUhQiy8PbqWIeBkk1d98E3S
 MttDQr6YyMX/SeQByjifrfP5MWYRASA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-qtRitQDzPLyspW0nFilLkg-1; Tue, 04 Feb 2020 15:33:25 -0500
Received: by mail-qt1-f197.google.com with SMTP id c8so13162000qte.22
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 12:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=THAEQOMHoaTiiOPbX7h8DNEEb4f2RS0VVJtOdkMrYnk=;
 b=YHFVKwNk/dQzQI1YdvG7Y8WrY9Evv6rkCrthvvZN6JGWndAK9yqul8tZHDws4TC3XO
 DvbSeUT2ynYUjnPn+eKxqu7+GGrPBoIDeWA19omyx7NypRa1Ofm+zYVIZpyQw2KLb6Lu
 A8cU/RugYA2PUeuJe7x7VQ/2k9MZ1El3i8q6b7/pCQqWKXJu13Ng7eSojvwZTYFGo6wo
 ZGjKmfMResUmXvFeJhhLqqOp7+IqgIVDA4A17dnAOUi7PHUPnPWRvN7Pd+ixW6N21Vcg
 rBu4OE/gtbi5Kt9nhbrsauOdwibr22IOzD9oJzDdzhbaZMb2OHNG0hhv2F69EXnfwbFT
 EibQ==
X-Gm-Message-State: APjAAAU6Q0OYrdMh5SP9NjS36hInflVe6Bd4TV+Qu1qLKNRXRyRLLRom
 ZGB10ZG9S0NOTQi3MJZToOCMREO0cX1DdflYQzL9F2SsLkSmNoURF1hsVytfS/SNUyvCJ+ogTPf
 OYgT409n3XhfxPRYTyoUXUCCA+6CeMJp0P06AmXHmvw==
X-Received: by 2002:a37:5f43:: with SMTP id t64mr29794586qkb.68.1580848404829; 
 Tue, 04 Feb 2020 12:33:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHCJIK6lZHuMLfq4/XKFYBcuLQvXb+yE8q6jIqNW3eBTt1giB0KZigC8t93YVW1+WpypJn1A==
X-Received: by 2002:a37:5f43:: with SMTP id t64mr29794566qkb.68.1580848404511; 
 Tue, 04 Feb 2020 12:33:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 21sm11604054qky.41.2020.02.04.12.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 12:33:23 -0800 (PST)
Date: Tue, 4 Feb 2020 15:33:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200204135817-mutt-send-email-mst@kernel.org>
References: <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
 <20200204114336-mutt-send-email-mst@kernel.org>
 <a94fe61e-e015-49f7-b6c1-3c5aff727996@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a94fe61e-e015-49f7-b6c1-3c5aff727996@redhat.com>
X-MC-Unique: qtRitQDzPLyspW0nFilLkg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

On Tue, Feb 04, 2020 at 05:56:22PM +0100, David Hildenbrand wrote:
> [...]
> 
> >>
> >> Issue 2: When called via the shrinker, (but also to fix Issue 1), it could be
> >> that we do have VIRTIO_BALLOON_F_MUST_TELL_HOST. I assume this means
> >> (-ENOCLUE) that we have to wait until the hypervisor notifies us via the STOP? Or
> >> for which event do we have to wait? Because there is no way to *tell host* here
> >> that we want to reuse a page. The hypervisor will *tell us* when we can reuse pages.
> >> For the shrinker it is simple: Don't use the shrinker with
> >> VIRTIO_BALLOON_F_MUST_TELL_HOST :) . But to fix Issue 1, we *would* have to wait
> >> until we get a STOP signal. That is not really possible because it might
> >> take an infinite amount of time.
> >>
> >> Michael, any clue on which event we have to wait with
> >> VIRTIO_BALLOON_F_MUST_TELL_HOST? IMHO, I don't think
> >> VIRTIO_BALLOON_F_MUST_TELL_HOST applies to VIRTIO_BALLOON_F_FREE_PAGE_HINT and
> >> we'd better document that. It introduces complexity with no clear benefit.
> > 
> > I meant that we must wait for host to see the hint. Signalled via using
> > the buffer.  But maybe that's too far in the meaning from
> > VIRTIO_BALLOON_F_MUST_TELL_HOST and we need a separate new flag for
> 
> Yes, that's what I think.
> 
> > that. Then current code won't be broken (yay!) but we need to
> > document another flag that's pretty similar.
> 
> I mean, do we need a flag at all as long as there is no user?
> Introducing a flag and documenting it if nobody uses it does not sound
> like a work I will enjoy :)

It's not the user. It's the non-orthogonality that I find inelegant.

Let me try to formulate the issue, forgive me for thinking aloud
(and I Cc'd virtio-dev since we are talking spec things here):

The annoying thing is that with Alex's VIRTIO_BALLOON_F_REPORTING
host does depend on guest not touching memory before host uses it.
So functionally VIRTIO_BALLOON_F_FREE_PAGE_HINT and
VIRTIO_BALLOON_F_REPORTING really are supposed to do
exectly the same thing, with the differences being
- VIRTIO_BALLOON_F_FREE_PAGE_HINT comes upon host's request.
  VIRTIO_BALLOON_F_REPORTING is initiated by guest.
- VIRTIO_BALLOON_F_FREE_PAGE_HINT does not always wait for
  host to use the hint before touching the page.
  Well it almost always does, but there's an exception in the
  shrinker which tries to stop reporting as quickly as possible
  in the case of a slow host.
  VIRTIO_BALLOON_F_REPORTING always does.
  This means host can blow the page away when it sees the hint.

Now the point is that with VIRTIO_BALLOON_F_REPORTING
I think you really must wait for host to use the hint.
But with VIRTIO_BALLOON_F_FREE_PAGE_HINT it depends
on how host uses it. Something to think about,
I'm not sure what is the best thing to do here.


> We can simply document "VIRTIO_BALLOON_F_MUST_TELL_HOST does not apply
> to FREE_PAGE_HINTING" and "with FREE_PAGE_HINTING, the guest can reuse
> pages any time, without waiting for a response/ack from the hypervisor".
> 
> Thoughts?
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
