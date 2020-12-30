Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F32E7A48
	for <lists.virtualization@lfdr.de>; Wed, 30 Dec 2020 16:26:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48C87867FE;
	Wed, 30 Dec 2020 15:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p221NKwfNEKK; Wed, 30 Dec 2020 15:26:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B632086AEF;
	Wed, 30 Dec 2020 15:26:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94735C013A;
	Wed, 30 Dec 2020 15:26:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 439F5C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 15:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 26EDE20372
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 15:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6TGOtwA5Pyk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 15:26:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by silver.osuosl.org (Postfix) with ESMTPS id 257EC20005
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 15:26:24 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id u19so15732666edx.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 07:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFUnyHgVyxuAtcRfcUjkuOgvyPAUgs/GS4VZo6V2EjY=;
 b=OeyEzg4V/aAACZ5WHrZtTgzeyRkX9dR1DakXcYGb6HpW0nZLrHmNUTBsnBP2KFaiiU
 iOvw2Uwo16qyOH63s9Gm2Md+VIjnFMyVYx/hqyGpYmDhMIGRe/hOr4qhldPYy703A+SB
 JX+79yp/Mb5TAHh9HWx6HXB2+j7Y7XoMOXSlPoLN6EpTJ4nHIK1ITdK81nnnKLNjBMC4
 GsOkNhjPIRcZLBXTaQZ9TMEP9Gmx9FG2VZ+2GB4D7tFfTs5uHhyYSh0IWJfdJxg9cg0p
 Ax5r+StVcwQLSjZPH5X4qUHE/V1FqiBD+yKiMJehgoAJkFQM3OI4745vkZXB4amaZ4ns
 UQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFUnyHgVyxuAtcRfcUjkuOgvyPAUgs/GS4VZo6V2EjY=;
 b=EVAwWI1cSKdqx+2xd/b0juoYe5Q18oQ0skMhxkQTHIeE317Z8HZqSYpGS4/CASVJ19
 tTasZE90K64bthOy8QEPzP3dhDdAxAQRwy0xOT7lkrmkb3J1e8iCBfFE0X+wxfpACIAS
 maQIiQuC5JuYlLV+MAYFbJrioqNilZzC3YH0ELr+JD2xx1GXhnK9a8e+ymq7aKSPg31A
 R9xUgP68WvKF3TEMi0b7lF6PomYBo05BWXGMPgq4eJBL0ls2HQD/uXDZ6IRZVUMQGJMH
 AMGqrdcAsIR2FvYsrXrwv7Y3chGRNY1JGrFQbdj4NRvGit82i3wa4Q1bV90ZIEEr7arD
 l8XA==
X-Gm-Message-State: AOAM530V4CKb9ZP+USakpt6Pl+s0JmYUKlLkNihBSG6ioEoabc0yITnz
 wMPmdbK/irg5yW/d88Fawao3EkM7SUlcdXn9hyg=
X-Google-Smtp-Source: ABdhPJzQNQAMolyl/FTKvwlV8rMw5P1Y8XV7RnokIFHNgGsZR+KndkMpIK62C9KqeH1cViiMOgpkAg62xMVFkhZW1K4=
X-Received: by 2002:aa7:c603:: with SMTP id h3mr46830503edq.254.1609341982552; 
 Wed, 30 Dec 2020 07:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20201228162233.2032571-1-willemdebruijn.kernel@gmail.com>
 <20201228162233.2032571-4-willemdebruijn.kernel@gmail.com>
 <20201230123854.GB2034@hoboy.vegasvil.org>
In-Reply-To: <20201230123854.GB2034@hoboy.vegasvil.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 30 Dec 2020 10:25:46 -0500
Message-ID: <CAF=yD-Ly3cdpj+B25Zgu+KYCE8ijV0+fQ_ssgjBAG2w8=iAp-Q@mail.gmail.com>
Subject: Re: [PATCH rfc 3/3] virtio-net: support transmit timestamp
To: Richard Cochran <richardcochran@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Willem de Bruijn <willemb@google.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Dec 30, 2020 at 7:38 AM Richard Cochran
<richardcochran@gmail.com> wrote:
>
> On Mon, Dec 28, 2020 at 11:22:33AM -0500, Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> >
> > Add optional delivery time (SO_TXTIME) offload for virtio-net.
> >
> > The Linux TCP/IP stack tries to avoid bursty transmission and network
> > congestion through pacing: computing an skb delivery time based on
> > congestion information. Userspace protocol implementations can achieve
> > the same with SO_TXTIME. This may also reduce scheduling jitter and
> > improve RTT estimation.
>
> This description is clear, but the Subject line is confusing.  It made
> me wonder whether this series is somehow about host/guest synchronization
> (but your comments do explain that that isn't the case).
>
> How about this instead?
>
>    virtio-net: support future packet transmit time

Yes, that's clearer. As is, this could easily be mistaken for
SOF_TIMESTAMPING_TX_*, which it is not. Will update, thanks.

Related terms already in use are SO_TXTIME, Earliest Delivery Time
(EDT) and Earliest TxTime First (ETF).

I should probably also s/TX_TSTAMP/TX_TIME/  in the code for the same reason.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
