Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A115269E
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 08:05:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 776038757C;
	Wed,  5 Feb 2020 07:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0O2vvfQjoEG; Wed,  5 Feb 2020 07:05:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A73D686B58;
	Wed,  5 Feb 2020 07:05:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97106C0174;
	Wed,  5 Feb 2020 07:05:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9F5BC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A125A203B0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etswOsmrjlr9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:05:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id DBD382035B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580886329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JHw6+/ySs4cWrJNj8bH+nVf35xXuNcS5JGraBBHTKWc=;
 b=UL7pkMTyz/Dj09EdjQokNLcGFiqRPyFPiRnooBLaO38NOWphf2gBZhHVwgNOpdY3Zz0vBV
 h1LCpu9Hzr7o+oqutUZqnTGzKTZJ+bvuRH0v+vcfejGEal5K2JuVgFTo97qNr8IjLbYRBQ
 RNLjYtys6VBAfXGBRT9ZBe8sMmCAVqI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-NeGDe6R6MGWJOOTglPA7Uw-1; Wed, 05 Feb 2020 02:05:26 -0500
Received: by mail-qk1-f197.google.com with SMTP id w29so685120qkw.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 23:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JHw6+/ySs4cWrJNj8bH+nVf35xXuNcS5JGraBBHTKWc=;
 b=VrJ5R0IRp3HE5GoRLUyc4ifgLZX9w/U2C0yfmIQ5mNdMr372zWo+rY/2nYww58SQaF
 2rguiA/JiRUzmUlt+WZEcDrnZJkImmnlGCEQNUeqBuC+DJqJqEfjuc5HrzcX37mVR4fD
 60E9hs47Aqg+FQtjwkTFFTMpc+Y0rOhW0Ghqrvf4x8Gdti/7GVunnbXjHgFSOW+W2ESw
 Rz4CChD/1uoWdOBnqaPijQcvQ0UY/vJrAnajKovixhpnWmh2/FdIH/f45x7OifWnanEc
 sB7UvEy0uCDXLH4h0lpXmYbjKIlq+wRilqDvXxz/M5wet1ztSFjSyxfVTl6RVhOj8lcN
 /hfA==
X-Gm-Message-State: APjAAAVtQwrBvV1/1iQOdqAjt/CSRIrm8CX3Vw5PZbEk3jF41b/PkfTF
 99BdILstHdFwXG/Y0/+ioB4iD9OS0sDSAzD/Ne1fXS2UXgTkA/pPiiNLJ5hcTTEYm8/qYNzJLhg
 CZYe87O6uw3mqb5cb/VOH0yYgH3/STuc/9e7565qHcQ==
X-Received: by 2002:ac8:4c86:: with SMTP id j6mr31457770qtv.14.1580886325575; 
 Tue, 04 Feb 2020 23:05:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7nGH0WZegXzQT7E7ZGLT5ts6hCXGlqzi9vJRGQU8h2EdNvicwY1bppj8zWwMPdUivgx1eyA==
X-Received: by 2002:ac8:4c86:: with SMTP id j6mr31457751qtv.14.1580886325344; 
 Tue, 04 Feb 2020 23:05:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 11sm12199283qko.76.2020.02.04.23.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 23:05:24 -0800 (PST)
Date: Wed, 5 Feb 2020 02:05:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200205015911-mutt-send-email-mst@kernel.org>
References: <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
 <20200204114336-mutt-send-email-mst@kernel.org>
 <286AC319A985734F985F78AFA26841F73E41F10F@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <286AC319A985734F985F78AFA26841F73E41F10F@shsmsx102.ccr.corp.intel.com>
X-MC-Unique: NeGDe6R6MGWJOOTglPA7Uw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
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

On Wed, Feb 05, 2020 at 06:52:34AM +0000, Wang, Wei W wrote:
> On Wednesday, February 5, 2020 12:50 AM, Michael S. Tsirkin wrote:
> > > Michael, any clue on which event we have to wait with
> > > VIRTIO_BALLOON_F_MUST_TELL_HOST? IMHO, I don't think
> > > VIRTIO_BALLOON_F_MUST_TELL_HOST applies to
> > > VIRTIO_BALLOON_F_FREE_PAGE_HINT and we'd better document that. It
> > introduces complexity with no clear benefit.
> > 
> > I meant that we must wait for host to see the hint.
> 
> Why?
> 
> Best,
> Wei

Well if we did the hint would be reliable, allowing host to immediately
drop any pages it gets in the hint. Originally I wanted to speed up
hinting by never waiting for host, but that does not seem to be what was
implemented: the only place we don't wait is the shrinker and it seems a
waste that we introduced complexity to host without getting any real
benefit out of it.

VIRTIO_BALLOON_F_MUST_TELL_HOST doesn't really apply to hinting
right now, so we could have used it to mean "hints must wait for host
to use buffers". I'm afraid it's already a wasted opportunity at
this point, reusing it isn't worth the compatibility headaches.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
