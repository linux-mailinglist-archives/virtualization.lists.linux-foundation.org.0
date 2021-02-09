Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 805603151E1
	for <lists.virtualization@lfdr.de>; Tue,  9 Feb 2021 15:45:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C93FC85DFD;
	Tue,  9 Feb 2021 14:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yzhea4HLY1AB; Tue,  9 Feb 2021 14:45:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3688985C19;
	Tue,  9 Feb 2021 14:45:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A9A4C013A;
	Tue,  9 Feb 2021 14:45:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0945C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B85F485C19
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFSDytPfRVXt
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:45:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 02DB385DEC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 14:45:47 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lg21so31997750ejb.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Feb 2021 06:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQ2Sbsh04NFaMe71kNZxj3e0nFEQR1f+t3TxK0bVaIo=;
 b=IPcimyS8NbOXMW/+bKdpJJPvlCvWUJhtBDm8ZGJwjbztAv7DdLG2t5mmtNxbYBGxlw
 dR4mRiTUMWbtyXJARz3qcsEp5PnAHF29vaxNUAvKDqdevswx9V6iyKqASySH1vGFcMRt
 tOQCnwoxeofpXqfhgr/RsP+NBr6McLBSgfzBC6SxsqxepOP4VI+WKEzGvKqKiiGQOwhM
 FQ23/Ze3hLIAVpkIajfqF0/kcyUNC2Fc3Fq6o+38aJkdopYuRhP+OHzVEQrtfLA/KMWR
 ur4NaL3lrWbY0LpdnRRjskhQDBKxE2RMDtluQ7InzYTwXD/sVHjwaSE2hygM1X8F8TJx
 x+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQ2Sbsh04NFaMe71kNZxj3e0nFEQR1f+t3TxK0bVaIo=;
 b=p9/jbDMtIYEENQ4T9iBCYAdoIHRiwm16g9WXEjdAme9X1DJN9MUsmOSftnxiTw2GYZ
 kiz75yzThdZWan4SKYHt5ejPrTCahbS6qPLemKbd047KG+qCCmjSWuDWl2iRw7gKp6oD
 r6IN2J7ZfAJiiQnWVXGT0jyN+zfH2NXL8reuBfYuDr5N3PHJs5SOqe9oc94qI7EcOIxU
 jAb1xeKor++cR1Mr7bV9mZ4BOUl4k6+bapI8ZZA0hER2C7JfAcORdpJRIGF0P0s1sYGG
 oYY78+5XX9jrd4XkKIkIUy0ryeEzVQKctKyGdb+kAkoJPMoqhBglLaUez+JRoruizE3N
 4VZA==
X-Gm-Message-State: AOAM531O0NmGcSigRNwXJs9LXb66CCKj6TVQXuwcU+TfcJysZ56CyAC/
 8YUTpz0Y5Fj+JKZBdEpfgDQLQBcV6GgdL9W17UQ=
X-Google-Smtp-Source: ABdhPJya2ASH85/oSguA4zNcrElGMNzUMUdXJzr+Up1XiFO445bGVGBxLDiqJcrTDOOfw4OhG+rvnm75yFYsPu3khHc=
X-Received: by 2002:a17:906:4dc5:: with SMTP id
 f5mr22394477ejw.11.1612881945274; 
 Tue, 09 Feb 2021 06:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20210208185558.995292-1-willemdebruijn.kernel@gmail.com>
 <20210208185558.995292-4-willemdebruijn.kernel@gmail.com>
 <20210209044125-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210209044125-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 9 Feb 2021 09:45:08 -0500
Message-ID: <CAF=yD-LepCKmpRbQyHP5+61ewCSpwOHmsQm_GNBcTi03Z5knXA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/4] virtio-net: support transmit timestamp
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>,
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

On Tue, Feb 9, 2021 at 4:43 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Feb 08, 2021 at 01:55:57PM -0500, Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> >
> > Add optional PTP hardware tx timestamp offload for virtio-net.
> >
> > Accurate RTT measurement requires timestamps close to the wire.
> > Introduce virtio feature VIRTIO_NET_F_TX_TSTAMP, the transmit
> > equivalent to VIRTIO_NET_F_RX_TSTAMP.
> >
> > The driver sets VIRTIO_NET_HDR_F_TSTAMP to request a timestamp
> > returned on completion. If the feature is negotiated, the device
> > either places the timestamp or clears the feature bit.
> >
> > The timestamp straddles (virtual) hardware domains. Like PTP, use
> > international atomic time (CLOCK_TAI) as global clock base. The driver
> > must sync with the device, e.g., through kvm-clock.
> >
> > Modify can_push to ensure that on tx completion the header, and thus
> > timestamp, is in a predicatable location at skb_vnet_hdr.
> >
> > RFC: this implementation relies on the device writing to the buffer.
> > That breaks DMA_TO_DEVICE semantics. For now, disable when DMA is on.
>
> If you do something like this, please do it in the validate
> callback and clear the features you aren't using.

Ah yes. Thanks for the tip. I'll do that ..

.. once I'm sure that this approach of using an outbuf for I/O is
actually allowed behavior. I'm not entirely convinced yet myself.
Jason also pointed out more specific concerns. I'll look into that
further.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
