Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D2174D7B
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 14:13:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78445875F9;
	Sun,  1 Mar 2020 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZ1iwctUdEDB; Sun,  1 Mar 2020 13:12:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA95287397;
	Sun,  1 Mar 2020 13:12:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C24BAC1D89;
	Sun,  1 Mar 2020 13:12:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CED0DC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 13:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CB94384ADA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 13:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5v-A970g24XP
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 13:12:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0EDA285413
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 13:12:43 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id 10so8319759ywv.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 05:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BXhAxcoRt4rzRvvqBlXaNvRsZeRD1Y8Wv8cie5PEOEo=;
 b=xkLErztTX0ZPF9z7LyLGUs6zdYQF9dbx7OngOPfirqVppB7DZEwteVyqJ3UZStPqsg
 znGrl53olatjfpQujMnmUiBzsbWXKi6+YW0WJEHHmiz8XnLaobya3YpF0E8ZmKt7DV5a
 e6w6RHqw+qvz9kWQRRecQuVlqQIWw7kukZLd9hfgDfGbjkR1an6WX25pqaNW+5EZ+6+E
 4Eb4b83w/8EQJbE6J3GuvnrviJc9Ftj9kMJlIfcHOLwK8oal/sK6WoqrIVtcO2cLwM9f
 fM+psyJDnZXtImMICHEEbeaEb/DC8aUILguu3m5kNcWbLOWE94PJx9MZSSUEGUFgBa54
 69+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BXhAxcoRt4rzRvvqBlXaNvRsZeRD1Y8Wv8cie5PEOEo=;
 b=NLENonBlh4Po1l+y55RpMjK27ItWlHlspxXsp+KIJvE1zi/S1koWbrN8L8eCTaJOOA
 saDU/PV3e8MuzjbJdtj7d43vVlyMsFShVlxr6oB21e76DA4BpuUYjBXV2RY8P+ab3bTU
 4e+8hIApGd3MnAW4hTi9iAa8Mg1JkxYSSyIhn6sC8Wet5SYZt6Kbb7oqQck4E8yi5kFb
 Jmr0+FwK8cAWwDWoe5/eOsKeIhdunglSuULfApDTaBphJFw6bqknWSNcHTdVU8O2BIeO
 XzzyYE/k8/VPwArr1n0jlCrzo4sxZx7V5pF764SUwAtvz7NhhGWhzFNlR5p/WEaZ+EpX
 I+sg==
X-Gm-Message-State: ANhLgQ14DsqZ1mKkNL/cy9BAvA3sKJdmoiv6x4VhnTS0y7iJde/bZc9Z
 2en85siL2yUhJSFFtVtge1Va8ucCiMR3pbLAIJkqWw3B
X-Google-Smtp-Source: APXvYqz7r81Ensc6/5OBHveWW0NdX7U7yd/wkXrCzmSEm001sDt3MpuCe3buX0iKkn/2jQ7zqLiJbZfNE7NRFoVFsUM=
X-Received: by 2002:a25:d912:: with SMTP id q18mr11892730ybg.370.1583066599248; 
 Sun, 01 Mar 2020 04:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20200301110733.20197-1-yuri.benditovich@daynix.com>
 <20200301110733.20197-2-yuri.benditovich@daynix.com>
 <20200301061745-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200301061745-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 1 Mar 2020 14:43:08 +0200
Message-ID: <CAOEp5OeNLa=0hJXOSrPvRbkm7XpE-uzq7vQB-GprXsoCgyk7kQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] virtio-net: Introduce extended RSC feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yan Vugenfirer <yan@daynix.com>, linux-kernel@vger.kernel.org,
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

No problem, I'll send an update

On Sun, Mar 1, 2020 at 1:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Mar 01, 2020 at 01:07:31PM +0200, Yuri Benditovich wrote:
> > VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
> > is able to provide extended RSC information. When the feature
> > is negotiatede and 'gso_type' field in received packet is not
> > GSO_NONE, the device reports number of coalesced packets in
> > 'csum_start' field and number of duplicated acks in 'csum_offset'
> > field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > ---
> >  include/uapi/linux/virtio_net.h | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> > index a3715a3224c1..536152fad3c4 100644
> > --- a/include/uapi/linux/virtio_net.h
> > +++ b/include/uapi/linux/virtio_net.h
> > @@ -57,6 +57,7 @@
> >                                        * Steering */
> >  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23        /* Set MAC address */
> >
> > +#define VIRTIO_NET_F_RSC_EXT   61    /* extended coalescing info */
> >  #define VIRTIO_NET_F_STANDBY   62    /* Act as standby for another device
> >                                        * with the same MAC.
> >                                        */
> > @@ -104,6 +105,7 @@ struct virtio_net_config {
> >  struct virtio_net_hdr_v1 {
> >  #define VIRTIO_NET_HDR_F_NEEDS_CSUM  1       /* Use csum_start, csum_offset */
> >  #define VIRTIO_NET_HDR_F_DATA_VALID  2       /* Csum is valid */
> > +#define VIRTIO_NET_HDR_F_RSC_INFO    4       /* rsc info in csum_ fields */
> >       __u8 flags;
> >  #define VIRTIO_NET_HDR_GSO_NONE              0       /* Not a GSO frame */
> >  #define VIRTIO_NET_HDR_GSO_TCPV4     1       /* GSO frame, IPv4 TCP (TSO) */
> > @@ -113,8 +115,14 @@ struct virtio_net_hdr_v1 {
> >       __u8 gso_type;
> >       __virtio16 hdr_len;     /* Ethernet + IP + tcp/udp hdrs */
> >       __virtio16 gso_size;    /* Bytes to append to hdr_len per frame */
> > -     __virtio16 csum_start;  /* Position to start checksumming from */
> > -     __virtio16 csum_offset; /* Offset after that to place checksum */
> > +     union {
> > +             __virtio16 csum_start;  /* Position to start checksumming from */
> > +             __le16 rsc_ext_num_packets; /* num of coalesced packets */
> > +     };
> > +     union {
> > +             __virtio16 csum_offset; /* Offset after that to place checksum */
> > +             __le16 rsc_ext_num_dupacks; /* num of duplicated acks */
>
> dupacks -> dup_acks ?
>
> Also wouldn't it be cleaner to have an rsc struct? And "num" is kind of
> extraneous, right?
> So how about we group the fields:
>
> union {
>         /* Unnamed struct for compatiblity. */
>         struct {
>                 csum_start
>                 csum_offset
>         };
>         struct {
>                 virtio16 start;
>                 virtio16 offset;
>         } csum;
>         struct {
>                 le16 packets;
>                 le16 dup_acks;
>         } rsc;
> };
>
>
> what do you think?
>
>
> > +     };
> >       __virtio16 num_buffers; /* Number of merged rx buffers */
> >  };
>
>
>
> > --
> > 2.17.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
