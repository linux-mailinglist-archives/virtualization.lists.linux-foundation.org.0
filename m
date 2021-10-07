Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0A42551A
	for <lists.virtualization@lfdr.de>; Thu,  7 Oct 2021 16:14:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78B6E60FA1;
	Thu,  7 Oct 2021 14:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RIKtasfflaf2; Thu,  7 Oct 2021 14:14:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7D9F0607FE;
	Thu,  7 Oct 2021 14:14:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03ACDC001E;
	Thu,  7 Oct 2021 14:14:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76775C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64CC560ABA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXUnxZs3ahEK
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:13:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB5E8607FE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:13:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10919610C7;
 Thu,  7 Oct 2021 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633616037;
 bh=pMU2+RK50Qv/4VNm4oFS8R4BonkUuJ2i0rz98X7NWhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpSjcM3QK3X61FROl/1mDyDtqYJ3tBxzr2t3/u4eL4dLAwK8fzYVVUi+bcaPC4Nq3
 T2u6n4P9JuB6Ehj0uaAeWHAULDpzB3OCDpfLWtaTIdxDUN12Wkt48OuytqvhvdnvKN
 HRoNCa2byULpYDcco/VmyD97jPLn77nshV3EVF2Q=
Date: Thu, 7 Oct 2021 16:13:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Corentin =?iso-8859-1?Q?No=EBl?= <corentin.noel@collabora.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YV8Ao5W4/z5sB5b9@kroah.com>
References: <5edaa2b7c2fe4abd0347b8454b2ac032b6694e2c.camel@collabora.com>
 <20211007090601-mutt-send-email-mst@kernel.org>
 <CANn89i+-P_mS-0jOM7SD4f291+Jbc9PORYJx2+gfQbebiX3z_A@mail.gmail.com>
 <b517d143c6ec0960eedcbf8f6917776bc67c5fd4.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b517d143c6ec0960eedcbf8f6917776bc67c5fd4.camel@collabora.com>
Cc: regressions@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-stable <stable@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>
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

On Thu, Oct 07, 2021 at 04:02:10PM +0200, Corentin No=EBl wrote:
> Le jeudi 07 octobre 2021 =E0 06:51 -0700, Eric Dumazet a =E9crit :
> > On Thu, Oct 7, 2021 at 6:11 AM Michael S. Tsirkin <mst@redhat.com>
> > wrote:
> > > On Thu, Oct 07, 2021 at 02:04:22PM +0200, Corentin No=EBl wrote:
> > > > I've been experiencing crashes with 5.14-rc1 and above that do
> > > > not
> > > > occur with 5.13,
> > =

> > What about 5.14 ?
> > =

> > 5.14-rc1 has many bugs we do not want to spend time rediscovering
> > them...
> > =

> =

> I've tested on 5.14, 5.15-rc4 and 5.15-rc4 with latest netdev and could
> reproduce the crash on them all.

Great, any chance you can use 'git bisect' to find the offending commit?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
