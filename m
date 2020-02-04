Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A428151724
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 09:40:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B83D84EEB;
	Tue,  4 Feb 2020 08:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmCJqJHb2hDS; Tue,  4 Feb 2020 08:40:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A274D84E88;
	Tue,  4 Feb 2020 08:40:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75A64C0174;
	Tue,  4 Feb 2020 08:40:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 024BAC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA71D1FFFE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m76s21BuTYgi
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:40:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id EEE2A1FEBF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580805648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dQcQglLlCkKta4U1WBX30Y7XJKXYxvMIejb3t3w8x8I=;
 b=TDb3YGWl/80sMuyLn1eJoFm9FGkYAIX6qWa2XiaEu0xnirj37M8w22o40eTUCbfBiPpPFG
 9zB9R5TgU2YdTf5atq/UPpschoLDcKMXR+4SI4/wDRIXjZiIip/xFgY46QqUsiWYv0d3Hv
 cgRhG7srmU1RhdYOCJTlvNk3EnWp5OQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-u1rQVicxM66_cPXkdpk0VQ-1; Tue, 04 Feb 2020 03:40:47 -0500
Received: by mail-qv1-f72.google.com with SMTP id l1so11257910qvu.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 00:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dQcQglLlCkKta4U1WBX30Y7XJKXYxvMIejb3t3w8x8I=;
 b=bKfy78dERC6YCWYniQfLJz94+ve+l6ns/fcM2ccVLhB6jCrK/ZSvoQN9RtdVp45uFd
 YI/nMugjVk3xzci1QX/2P/0L99wRlSlIiurKTMnbc7PoXbKVa1suCKx7w9AzzpddpAsX
 +vUNifUcCEPNFAVgAjMM5dRfZA4LEkquHTBJbK9IzW/dcF3LgMJd534Q/WC0p3cDx0Sb
 Jk0TkM+Hn21MQNV2OTQQF4WyG1QpL2RTzQqJBugfXI9zKd+H7eZ+JDH/4Mccx9+LER/L
 s0vQcL1wPadFEZ/ULV2xuR6dA82RboiY85V2KB9L5sNXMcvm69po74P7oXqWN48SBDkX
 4Kiw==
X-Gm-Message-State: APjAAAWzmBDRByzO9CLxA5cXMs07cwV/5Irnh8TitUEHMWj8KeqmV6ti
 wkv8PZJUR9pGgvBIPh5nrlKVaghUHKPbODot4KTMC7B3rTcOHpi+rjeFbgkf0z1Zl6Q70SwIgPy
 9S/jq80UKl3y9Xc3oe0IUAFWPbdIkxkCwmzB3i1XvPA==
X-Received: by 2002:a37:9fc9:: with SMTP id
 i192mr27239826qke.364.1580805646350; 
 Tue, 04 Feb 2020 00:40:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZbIFvON47XBsf+YxKwKbKbbnXPqprIXWv2YokTA2ouyLaOwtkMJDba1+q1B9SA1PuTcX72A==
X-Received: by 2002:a37:9fc9:: with SMTP id
 i192mr27239806qke.364.1580805646091; 
 Tue, 04 Feb 2020 00:40:46 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id f28sm10663327qkk.130.2020.02.04.00.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 00:40:45 -0800 (PST)
Date: Tue, 4 Feb 2020 03:40:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200204033657-mutt-send-email-mst@kernel.org>
References: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
X-MC-Unique: u1rQVicxM66_cPXkdpk0VQ-1
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

On Tue, Feb 04, 2020 at 09:35:21AM +0100, David Hildenbrand wrote:
> >>> I would say reverting probably makes sense. I'm not sure there is much
> >>> value to having a shrinker running deflation when you are actively trying
> >>> to increase the balloon. It would make more sense to wait until you are
> >>> actually about to start hitting oom.
> >>
> >> I think the shrinker makes sense for free page hinting feature
> >> (everything on free_page_list).
> >>
> >> So instead of only reverting, I think we should split it up and always
> >> register the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT and the OOM
> >> notifier (as before) for VIRTIO_BALLOON_F_MUST_TELL_HOST.
> 
> s/VIRTIO_BALLOON_F_MUST_TELL_HOST/VIRTIO_BALLOON_F_DEFLATE_ON_OOM/
> 
> :)

Well VIRTIO_BALLOON_F_MUST_TELL_HOST is also broken by shrinker
with VIRTIO_BALLOON_F_FREE_PAGE_HINT as that code adds buffers
but does not wait for them to be used even with VIRTIO_BALLOON_F_MUST_TELL_HOST.
We never noticed because QEMU does not advertize
VIRTIO_BALLOON_F_MUST_TELL_HOST.


> >>
> >> (Of course, adapting what is being done in the shrinker and in the OOM
> >> notifier)
> > 
> > David,
> > 
> > Please keep me posted. I decided to adapt the same solution as the virtio
> > balloon for the VMware balloon. If the verdict is that this is damaging and
> > the OOM notifier should be used instead, I will submit patches to move to
> > OOM notifier as well.
> 
> Will do. It all sounds sub-optimal to me at this point ... but I prefer
> the old variant where a simple "drop_slab()" won't deflate the balloon.
> That looks broken to me.

Okay. Could you post a patch?

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
