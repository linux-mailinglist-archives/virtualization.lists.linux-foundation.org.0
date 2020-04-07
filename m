Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B901A0AD3
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 12:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C02123735;
	Tue,  7 Apr 2020 10:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDcS6q8L4GFc; Tue,  7 Apr 2020 10:09:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3119A20452;
	Tue,  7 Apr 2020 10:09:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06155C0177;
	Tue,  7 Apr 2020 10:09:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92914C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8966487E7B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTA6LUa9nppo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:09:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC20B878C8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586254139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+d4Qx7H0BkaQ6jx/a91Q5D/w2sYbHgdntEiY9YRCI4=;
 b=CStfb/LrWDiB3GXtrAIRy+WdvioVVcCqCRq1d75lAclz/c5V2v2FZn0aD1l6qzUmQVYObN
 A1PNCz/PZbntEYu/+KO5Zcen5ma/PgYrZF4VWAxNHoDMc/T4IjOUaV/9K0S/eKSsmTsEqI
 dDH3h3IZTNUANrhbbNiGNU2t56MWc/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-cfK9vKNwO_mVVDJnb5Me-g-1; Tue, 07 Apr 2020 06:08:55 -0400
X-MC-Unique: cfK9vKNwO_mVVDJnb5Me-g-1
Received: by mail-wr1-f71.google.com with SMTP id a10so1522100wra.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Apr 2020 03:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z+d4Qx7H0BkaQ6jx/a91Q5D/w2sYbHgdntEiY9YRCI4=;
 b=EN1sTCPiQp2jtjlBrbVcgxffhTxtdU5KfLVH1oO36G1E1uv68ORLfpoeZYiBxBiD1k
 ogbxLWJvrs8PZ+MaItrgEXhYP91X8lY7MA7DEhKGs4U9LCdPuQa02rk62VJZ5ELTDk6s
 6mXdmmcFpEveVWXOQRtnnuRvhV788fxktwaAbWDazFmTDj/oc+Qf9hgbFHgS/j2T7RBu
 gLOCe4/oDlTQSAYetthEsXPlRGBGGJ5KUnVvAU2XCZOvuh7JN/MBeWqg5W91cQLj3Hzk
 VFTDDVXkPXQKDmgW+qOhTbq/gapnfrkwR2CfY7SSIGYMeHga4l2KqgcKUmJ9C+hnqJrF
 Qh5g==
X-Gm-Message-State: AGi0PuZRjcWXVfFoP7qB8JgNE292y5PrxuzyAMryidccrPbCHy4NLiJY
 iGd04UvoOCobCT0gKrRKO8IgPmHQeF07KDv+Dpp1dZiOS2f94I32xhlMHZ7XoppDKj9B8+16b4p
 gYm7GCDQHRV0ueewt9btmsvi3aT3uJyfvtMUt823RPg==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr1583542wmg.50.1586254134335; 
 Tue, 07 Apr 2020 03:08:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypJjB2szx0xQgD9OibxDJRFX1Jm7Z1KhFoXl8BhDzxrbWSAltbqVX49bIubsJYfEtbHFRe8h+g==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr1583516wmg.50.1586254134095; 
 Tue, 07 Apr 2020 03:08:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id n64sm1571755wme.45.2020.04.07.03.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 03:08:53 -0700 (PDT)
Date: Tue, 7 Apr 2020 06:08:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [GIT PULL v2] vhost: cleanups and fixes
Message-ID: <20200407060741-mutt-send-email-mst@kernel.org>
References: <20200407055334-mutt-send-email-mst@kernel.org>
 <00a7ce5f-8fb4-8c3e-7113-9a422682abdf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <00a7ce5f-8fb4-8c3e-7113-9a422682abdf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tiwei.bie@intel.com, kvm@vger.kernel.org, yuri.benditovich@daynix.com,
 netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, tysand@google.com,
 eperezma@redhat.com, xiao.w.wang@intel.com, namit@vmware.com,
 rientjes@google.com, alexander.h.duyck@linux.intel.com, mhocko@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, lingshan.zhu@intel.com
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

On Tue, Apr 07, 2020 at 11:56:59AM +0200, David Hildenbrand wrote:
> On 07.04.20 11:53, Michael S. Tsirkin wrote:
> > Changes from PULL v1:
> > 	reverted a commit that was also in Andrew Morton's tree,
> > 	to resolve a merge conflict:
> > 	this is what Stephen Rothwell was doing to resolve it
> > 	in linux-next.
> > 
> > 
> > Now that many more architectures build vhost, a couple of these (um, and
> > arm with deprecated oabi) have reported build failures with randconfig,
> > however fixes for that need a bit more discussion/testing and will be
> > merged separately.
> > 
> > Not a regression - these previously simply didn't have vhost at all.
> > Also, there's some DMA API code in the vdpa simulator is hacky - if no
> > solution surfaces soon we can always disable it before release:
> > it's not a big deal either way as it's just test code.
> > 
> > 
> > The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:
> > 
> >   Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
> > 
> > for you to fetch changes up to 835a6a649d0dd1b1f46759eb60fff2f63ed253a7:
> > 
> >   virtio-balloon: Revert "virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM" (2020-04-07 05:44:57 -0400)
> > 
> > ----------------------------------------------------------------
> > virtio: fixes, vdpa
> > 
> > Some bug fixes.
> > The new vdpa subsystem with two first drivers.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----------------------------------------------------------------
> > David Hildenbrand (1):
> >       virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM
> 
> ^ stale leftover in this message only I assume

No - I did not rebase since I did not want to invalidate all the testing
people did, just tacked a revert on top.  So this commit is there
together with its revert.


> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
