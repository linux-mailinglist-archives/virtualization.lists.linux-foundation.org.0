Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85611CD4F
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 13:36:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DAC0588117;
	Thu, 12 Dec 2019 12:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31wsQicSR9Le; Thu, 12 Dec 2019 12:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22F3487CDA;
	Thu, 12 Dec 2019 12:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01945C0881;
	Thu, 12 Dec 2019 12:36:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD01FC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D2BD5204CE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCU0Ix5rsS0B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:36:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id C60C120466
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576154191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5jEwa/INyC4DP48t36rpEFTUTAa5OhD9GvWQHvMv/Y=;
 b=JDEJqBdJtud/7bR4//a2iWuH/qfkEOPVNRWrfdVlzehk2E7oaYOONQ6zA3YLEcBsELBpOq
 zyqa7pfNUjcoo1yZsciSVlz9Kb8uZx9BLBS0wLFSpLWt+28qyfo01fivVL1uGMevx2ty+R
 ettRRPA/a3cXRc8hba2YlPSzEWpkBxE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-wymqcaviOJmVCnSnV0rhIA-1; Thu, 12 Dec 2019 07:36:29 -0500
Received: by mail-wr1-f71.google.com with SMTP id d8so969741wrq.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 04:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vx9zJGf1oMGJUZXazsjSWnZ1RqAwmrURKhXjqCuTSZw=;
 b=pje8uy1oM4CyZdhLcVmDb7xfyYWMaWPtchSXtCoCUglJ+bqPJLjSEcfry+cfnelkv6
 cxXvkPaPW+ZbJ2ZNvxyl0LYtwvt+0ui4GZrktzjE4sF1BdCvcx8S8h7nCNLnZ6VY1Jzf
 z5dmXx5/3CFpwailB31GukMPuwzRvpMcFQ+Wx7IdCTFX1XUn3qeWZLl40zyWqrKmddAi
 4bRw7TdGbHNe3L+mxugkwSP5TWtxlFow/hYjrcoiR6zblnzVk3cl7ybuxE9R+m8Ac94A
 k0e8PBr/2c4manURtMca8J4HkuEYV6T276EMF0o23uNnmGE+10y4g2i91zRawlU2R0K2
 baqQ==
X-Gm-Message-State: APjAAAWhY9qzDj87Kf9teOJeB0I+MzaPSFFbaS3bdxc+IxoNLz2qvJjh
 HNo3OUYbWLsmaRomLHGhWJDs7GowRtSLeTCiNDwlIjCn6OJE6rrhRnHWflgrmUjj+8PNRBuTG69
 Gvs/GCvphtoldzi22RFSUg7w7yxuNpjgbv1Ljhotlcg==
X-Received: by 2002:a1c:9893:: with SMTP id a141mr6328747wme.131.1576154187818; 
 Thu, 12 Dec 2019 04:36:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8OuvK7uQUGPj2YPMKShfitWnCo2iXv2VXIudtkzMfeAvfFAzJUBd43fFj7MHbtZkQxZXP5g==
X-Received: by 2002:a1c:9893:: with SMTP id a141mr6328729wme.131.1576154187582; 
 Thu, 12 Dec 2019 04:36:27 -0800 (PST)
Received: from steredhat ([95.235.120.92])
 by smtp.gmail.com with ESMTPSA id x10sm5861395wrp.58.2019.12.12.04.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 04:36:27 -0800 (PST)
Date: Thu, 12 Dec 2019 13:36:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <20191212123624.ahyhrny7u6ntn3xt@steredhat>
References: <20191206143912.153583-1-sgarzare@redhat.com>
 <20191211110235-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191211110235-mutt-send-email-mst@kernel.org>
X-MC-Unique: wymqcaviOJmVCnSnV0rhIA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Wed, Dec 11, 2019 at 11:03:07AM -0500, Michael S. Tsirkin wrote:
> On Fri, Dec 06, 2019 at 03:39:12PM +0100, Stefano Garzarella wrote:
> > When we receive a new packet from the guest, we check if the
> > src_cid is correct, but we forgot to check the dst_cid.
> > 
> > The host should accept only packets where dst_cid is
> > equal to the host CID.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> Stefano can you clarify the impact pls?

Sure, I'm sorry I didn't do it earlier.

> E.g. is this needed on stable? Etc.

This is a better analysis (I hope) when there is a malformed guest
that sends a packet with a wrong dst_cid:
- before v5.4 we supported only one transport at runtime, so the sockets
  in the host can only receive packets from guests. In this case, if
  the dst_cid is wrong, maybe the only issue is that the getsockname()
  returns an inconsistent address (the cid returned is the one received
  from the guest)

- from v5.4 we support multi-transport, so the L1 VM (e.g. L0 assigned
  cid 5 to this VM) can have both Guest2Host and Host2Guest transports.
  In this case, we have these possible issues:
  - L2 (or L1) guest can use cid 0, 1, and 2 to reach L1 (or L0),
    instead we should allow only CID_HOST (2) to reach the level below.
    Note: this happens also with not malformed guest that runs Linux v5.4

  - if a malformed L2 guest sends a packet with the wrong dst_cid, for example
    instead of CID_HOST, it uses the cid assigned by L0 to L1 (5 in this
    example), this packets can wrongly queued to a socket on L1 bound to cid 5,
    that only expects connections from L0.

Maybe we really need this only on stable v5.4, but the patch is very simple
and should apply cleanly to all stable branches.

What do you think?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
