Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53311CDA2
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 13:56:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 11770887F6;
	Thu, 12 Dec 2019 12:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JlzoqoGiLGr; Thu, 12 Dec 2019 12:56:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8EBE5887FE;
	Thu, 12 Dec 2019 12:56:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 725BDC0881;
	Thu, 12 Dec 2019 12:56:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDA4BC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B9FEA882DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TeyqN4Ih7q+W
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:56:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E907E882D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576155393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsMkvXIkZIJ3BADOD+9uViW7s5h5iJrnk4Ihd/S9G4U=;
 b=dSpgV/EAY5h6dwwKIjVA5+sf0ILCygWhrcU0aPC1AhLurrvfVcSieFfPXylOTPtgJJmn45
 qhytPs94FtBT0VBjih8w7wHAFa5RVBRKPl9B+KsVSAAOfEARc8QbusZ121a3I0Fctjc+dn
 MBWZ0SPyHAu1VrRJu92K0YnrMkwM40o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-DjZZkdHLPb23nwoHOT69bQ-1; Thu, 12 Dec 2019 07:56:32 -0500
Received: by mail-qv1-f69.google.com with SMTP id 75so1417360qva.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 04:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BQ/OeprMEEQbDYMzEQzXy36w02TkBbbXNkwJyG1iOw4=;
 b=ltEszUYltoPn1XyFCconvPUlLkNoEOWA8meYOtJq2mWiaqHB1lE76CGWM4OSN3wfUh
 mt/JnetPVcCUZYbM1tWMaV/2yq4AkE0XOB5RHqI6c4RvQNSWgAFWcQmUUTMV654PV8RR
 nEf196j29VVkUdUAxLevnPjlOrA2HToSspmVgfayCVv+Bw5wsN4QU+F3n0d1+232toXL
 YXD3WdS5iYhba54EsFj7Ze9dwLiJ7rWA1kurLGaFHJJv9D7QTaqeWq5hYERHJukALjY6
 qTTeiMlt5tF9xIgYO+kQc33nuMQgeBLzq6PtYyRWx8QuR218JiKqLGNIdAU6sqUo8Ph1
 rGMA==
X-Gm-Message-State: APjAAAWTlk+cQ/UTkT/BYek0aYp1+Zxv1ipq/W39/G6C9zE96WqJKKyN
 WRxXMLcNcPuaz9CeMaZjvFH10Vl7XcSD+UBrHELFzzajPl+0z7kMtyCdYVmp9fNg4NW4c2rxENi
 FDtMesd8B7YzzzWeb2nEMP6lQYtBCx87gTE+xvMbgGQ==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr7374526qtj.344.1576155392080; 
 Thu, 12 Dec 2019 04:56:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGAOqNeoXt3nIrQGWq7m2hfYKhqzgGGgHCw70gSt6fz7ekSW8rLr9/hwp3tuH2X5BB5yIhKQ==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr7374504qtj.344.1576155391867; 
 Thu, 12 Dec 2019 04:56:31 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id d23sm2191968qte.32.2019.12.12.04.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 04:56:30 -0800 (PST)
Date: Thu, 12 Dec 2019 07:56:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <20191212075356-mutt-send-email-mst@kernel.org>
References: <20191206143912.153583-1-sgarzare@redhat.com>
 <20191211110235-mutt-send-email-mst@kernel.org>
 <20191212123624.ahyhrny7u6ntn3xt@steredhat>
MIME-Version: 1.0
In-Reply-To: <20191212123624.ahyhrny7u6ntn3xt@steredhat>
X-MC-Unique: DjZZkdHLPb23nwoHOT69bQ-1
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

On Thu, Dec 12, 2019 at 01:36:24PM +0100, Stefano Garzarella wrote:
> On Wed, Dec 11, 2019 at 11:03:07AM -0500, Michael S. Tsirkin wrote:
> > On Fri, Dec 06, 2019 at 03:39:12PM +0100, Stefano Garzarella wrote:
> > > When we receive a new packet from the guest, we check if the
> > > src_cid is correct, but we forgot to check the dst_cid.
> > > 
> > > The host should accept only packets where dst_cid is
> > > equal to the host CID.
> > > 
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > Stefano can you clarify the impact pls?
> 
> Sure, I'm sorry I didn't do it earlier.
> 
> > E.g. is this needed on stable? Etc.
> 
> This is a better analysis (I hope) when there is a malformed guest
> that sends a packet with a wrong dst_cid:
> - before v5.4 we supported only one transport at runtime, so the sockets
>   in the host can only receive packets from guests. In this case, if
>   the dst_cid is wrong, maybe the only issue is that the getsockname()
>   returns an inconsistent address (the cid returned is the one received
>   from the guest)
> 
> - from v5.4 we support multi-transport, so the L1 VM (e.g. L0 assigned
>   cid 5 to this VM) can have both Guest2Host and Host2Guest transports.
>   In this case, we have these possible issues:
>   - L2 (or L1) guest can use cid 0, 1, and 2 to reach L1 (or L0),
>     instead we should allow only CID_HOST (2) to reach the level below.
>     Note: this happens also with not malformed guest that runs Linux v5.4
>   - if a malformed L2 guest sends a packet with the wrong dst_cid, for example
>     instead of CID_HOST, it uses the cid assigned by L0 to L1 (5 in this
>     example), this packets can wrongly queued to a socket on L1 bound to cid 5,
>     that only expects connections from L0.

Oh so a security issue?

> 
> Maybe we really need this only on stable v5.4, but the patch is very simple
> and should apply cleanly to all stable branches.
> 
> What do you think?
> 
> Thanks,
> Stefano

I'd say it's better to backport to all stable releases where it applies,
but yes it's only a security issue in 5.4.  Dave could you forward pls?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
