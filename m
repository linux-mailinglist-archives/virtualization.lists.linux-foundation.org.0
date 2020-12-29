Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144E2E6CFE
	for <lists.virtualization@lfdr.de>; Tue, 29 Dec 2020 02:24:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96B61842C3;
	Tue, 29 Dec 2020 01:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7OBIWaiAe41; Tue, 29 Dec 2020 01:24:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39DB8843FD;
	Tue, 29 Dec 2020 01:24:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11D14C0174;
	Tue, 29 Dec 2020 01:24:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ABA6C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 01:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5E89886DFC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 01:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2A7SDkl+Snx2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 01:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 74B1586DF5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 01:24:08 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id h6so6389617vsr.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 17:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2a5OK9SG8uiwL6oCqh8QCSJ6wAjCRpa+IqBksvjIEo=;
 b=qPdGtihtFbUnrVsjgdK4pEYgia8WaQCs6UHV+fLsBle8vJ5EI//QBVzUdOo26CMtmA
 JwwbTGzRLfWsZEcr1R7oILmbaiWNla0C7l2VfEWaO4AJqteBDQ1wXTNWaKGFrTB5QVBP
 +R8vtTxhtjE6oegOFX70W5Ue7zMbFoDkaZhy7+60uXY32qIzo7fTy5E9uREWlNfhrNte
 wpGbAhJUBoF3Y+GLLA+oQeQ4nrh9RfFHENej3Q+T5mQ0BrNpyL+kbDFMS5BvF4Q5UWmi
 ssL3Fyzu4uhuMvbpZ3/5bej95gQbd89PzzRKMds4GukuESbJFsSlgXQtRx39zODUSgB+
 qbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2a5OK9SG8uiwL6oCqh8QCSJ6wAjCRpa+IqBksvjIEo=;
 b=oWn1Iz+fpyyhCecal4ERVPiIbCZgyAADmO5qrInLF4qgXTjIHFqnlWsG3uLaa+txdj
 qnIf56mfqwdLZyYXDnrvg9Km/kC3Xu6x0tcYm6EeO6oiKGg97zZNEER6fuB4wxHnUXOE
 rarLPdGqQ9tFj5eGqeRRz50/54uINLOF9pq9nQAuHLMTBkFYlDOwFVtU5fkgCP40CTKW
 3wFNLki1z0o0usI3SnWunNnUUaHCTkijFYJPNq2k4fNMvjnKTd8o70zWwBchyjBfqJK4
 boljNbqhaIko2k5Zl/IlGOLAAm9WNHhqgVMKUxTMdotJP1jT3K9gcYkwFQeLVRUgRyg/
 3VdA==
X-Gm-Message-State: AOAM530WWgauknVEAh7jHSd3tAJb9dTsyK46caLG2hbIVZ1J91XM30fi
 xfDccrhS8tB7JPiJ+Fwvp6ZjR7nVfKA=
X-Google-Smtp-Source: ABdhPJyY4EFEG5uNjne/0+4EUFBfJbdNBCpR8uWZbbbUYBIUNst5smpT9R9tlwULnJIyPBJloqvv1g==
X-Received: by 2002:a67:f457:: with SMTP id r23mr29103355vsn.3.1609205046832; 
 Mon, 28 Dec 2020 17:24:06 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id 30sm3823760uab.18.2020.12.28.17.24.06
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 17:24:06 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id w7so3883091uap.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 17:24:06 -0800 (PST)
X-Received: by 2002:ab0:59af:: with SMTP id g44mr31119147uad.37.1609205045560; 
 Mon, 28 Dec 2020 17:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20201228162233.2032571-1-willemdebruijn.kernel@gmail.com>
 <20201228162233.2032571-2-willemdebruijn.kernel@gmail.com>
 <20201228163359-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201228163359-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 28 Dec 2020 20:23:29 -0500
X-Gmail-Original-Message-ID: <CA+FuTSeoZBQdeT9h0WxzX_wtn0DXYiH7A_EAKXyVpDtMhjW+KQ@mail.gmail.com>
Message-ID: <CA+FuTSeoZBQdeT9h0WxzX_wtn0DXYiH7A_EAKXyVpDtMhjW+KQ@mail.gmail.com>
Subject: Re: [PATCH rfc 1/3] virtio-net: support transmit hash report
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Network Development <netdev@vger.kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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

On Mon, Dec 28, 2020 at 4:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Dec 28, 2020 at 11:22:31AM -0500, Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> >
> > Virtio-net supports sharing the flow hash from host to guest on rx.
> > Do the same on transmit, to allow the host to infer connection state
> > for more robust routing and telemetry.
> >
> > Linux derives ipv6 flowlabel and ECMP multipath from sk->sk_txhash,
> > and updates these fields on error with sk_rethink_txhash. This feature
> > allows the host to make similar decisions.
> >
> > Besides the raw hash, optionally also convey connection state for
> > this hash. Specifically, the hash rotates on transmit timeout. To
> > avoid having to keep a stateful table in the host to detect flow
> > changes, explicitly notify when a hash changed due to timeout.
> >
> > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > ---
> > diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> > index 3f55a4215f11..f6881b5b77ee 100644
> > --- a/include/uapi/linux/virtio_net.h
> > +++ b/include/uapi/linux/virtio_net.h
> > @@ -57,6 +57,7 @@
> >                                        * Steering */
> >  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23        /* Set MAC address */
> >
> > +#define VIRTIO_NET_F_TX_HASH   56    /* Guest sends hash report */
> >  #define VIRTIO_NET_F_HASH_REPORT  57 /* Supports hash report */
> >  #define VIRTIO_NET_F_RSS       60    /* Supports RSS RX steering */
> >  #define VIRTIO_NET_F_RSC_EXT   61    /* extended coalescing info */
> > @@ -170,8 +171,15 @@ struct virtio_net_hdr_v1_hash {
> >  #define VIRTIO_NET_HASH_REPORT_IPv6_EX         7
> >  #define VIRTIO_NET_HASH_REPORT_TCPv6_EX        8
> >  #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
> > +#define VIRTIO_NET_HASH_REPORT_L4              10
> > +#define VIRTIO_NET_HASH_REPORT_OTHER           11
>
> Need to specify these I guess ...
> Can't there be any consistency with RX hash?
> Handy for VM2VM ...

Agreed. Unfortunately the skb hash does only distinguishes between L4
and not. And for many purposes that is sufficient.

Implementing the existing flags would require flow dissection, at cpu cost.

I did add the flags to the same field, so that the less specific .._L4
and .._OTHER are valid rx-hash values as well.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
