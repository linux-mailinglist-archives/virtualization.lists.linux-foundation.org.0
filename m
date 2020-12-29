Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAF2E6CE8
	for <lists.virtualization@lfdr.de>; Tue, 29 Dec 2020 01:58:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9AE602041F;
	Tue, 29 Dec 2020 00:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUk66nhnlPSL; Tue, 29 Dec 2020 00:58:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5267320452;
	Tue, 29 Dec 2020 00:58:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B727C1DA6;
	Tue, 29 Dec 2020 00:58:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D2C7C1DA4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 00:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2EF782043E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 00:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nr66IIl2apXr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 00:58:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by silver.osuosl.org (Postfix) with ESMTPS id 42C7E2041F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 00:58:01 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id f16so3862327uav.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 16:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IYmN8eIH7rNg13rLJ8T9I7B/b/Ox/WImS0U1BiM5xfo=;
 b=cVOlQXA5gn0LRJIhGclSNTGOOrEdfA0HH5LdJ1TUcRxDGlCkN7BFvcH4flkN0S5pmv
 StmgJzGH6TH8mwbPbJzjv8pjDhQ+z4nkCljMo7achB1b+YB0e4OgoH9NL34qZo0NhzuY
 52VPsre/iIo948PiUXEJdRc5DDNEQo81yfI9kro6B67ooXZmFwVhL8hCzjSYMbG7oGL5
 ZVX4gPZbtxPpOifCNJH62H9kf/hiY1GMbc0S/ABywJmy6G9TW2tOWEYSvZZn+u2PYX6r
 0DbLCmbnuFi7WVoegSDDaTCI4sxFCVqsvIoiDOgh9OiLXqEfwLjoBGcCBLAqQWWtN30M
 Cfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IYmN8eIH7rNg13rLJ8T9I7B/b/Ox/WImS0U1BiM5xfo=;
 b=HWeSfvW7ZNf/EIvorr9ppzVSwgo37JWigIQwoinSSsX5SxpvUarc0SamWlZjewGr/r
 rJzHJggSsNQE+36nN8fnSSFAfskeyqdUiWYz1u2YR2tHlY3SCpRWo8owC50yuXdCfb4v
 bWuYucqRv5BeI901RE3+ku/oo8hf6m8U5RJA+/4Q2vP5GkrHvGBtlP/QfhabMD4HDaMm
 YkvUIxbgKy2L6qB1Lt3Ny+lrann35R9pV2qkv4+UpqkXLF5yO8zR1ccBoWFm3Y650YeY
 GNLipj+wpKAxThkbIgmWeSizMhm7bMbKS6Iqm5RAFmcm4T+dWGBX1wpUeF4pAUXgfOPB
 MxLg==
X-Gm-Message-State: AOAM532ibyjTLlLnYkaHdug4XV6UiCm+BKP/LvOO+WJytVqZPrmxIvzN
 ZplEinkmZNN5sViily8itUpaKuQ39G4=
X-Google-Smtp-Source: ABdhPJxBDakHtLoet0oAfGWmCIJUis6cjk8q5zlC1DOlMHhbyPKf7V4Yyzm+xyJEP4DhdMx8QtwuuQ==
X-Received: by 2002:ab0:146d:: with SMTP id c42mr28947469uae.56.1609203479559; 
 Mon, 28 Dec 2020 16:57:59 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id w23sm4085063uau.8.2020.12.28.16.57.58
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 16:57:58 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id z16so6380435vsp.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 16:57:58 -0800 (PST)
X-Received: by 2002:a67:3201:: with SMTP id y1mr29582471vsy.22.1609203477776; 
 Mon, 28 Dec 2020 16:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20201228162233.2032571-1-willemdebruijn.kernel@gmail.com>
 <20201228162233.2032571-3-willemdebruijn.kernel@gmail.com>
 <20201228145953.08673c8c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201228145953.08673c8c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 28 Dec 2020 19:57:20 -0500
X-Gmail-Original-Message-ID: <CA+FuTSe630QvTRM-0fnz=B+QRfii=sbsb-Qp5tTc2zbMgxcQyw@mail.gmail.com>
Message-ID: <CA+FuTSe630QvTRM-0fnz=B+QRfii=sbsb-Qp5tTc2zbMgxcQyw@mail.gmail.com>
Subject: Re: [PATCH rfc 2/3] virtio-net: support receive timestamp
To: Jakub Kicinski <kuba@kernel.org>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
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

On Mon, Dec 28, 2020 at 5:59 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 28 Dec 2020 11:22:32 -0500 Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> >
> > Add optional PTP hardware timestamp offload for virtio-net.
> >
> > Accurate RTT measurement requires timestamps close to the wire.
> > Introduce virtio feature VIRTIO_NET_F_RX_TSTAMP. If negotiated, the
> > virtio-net header is expanded with room for a timestamp. A host may
> > pass receive timestamps for all or some packets. A timestamp is valid
> > if non-zero.
> >
> > The timestamp straddles (virtual) hardware domains. Like PTP, use
> > international atomic time (CLOCK_TAI) as global clock base. It is
> > guest responsibility to sync with host, e.g., through kvm-clock.
>
> Would this not be confusing to some user space SW to have a NIC with
> no PHC deliver HW stamps?
>
> I'd CC Richard on this, unless you already discussed with him offline.

Thanks, good point. I should have included Richard.

There is a well understood method for synchronizing guest and host
clock in KVM using ptp_kvm. For virtual environments without NIC
hardware offload, the when host timestamps in software, this suffices.

Syncing host with NIC is assumed if the host advertises the feature
and implements using real hardware timestamps.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
