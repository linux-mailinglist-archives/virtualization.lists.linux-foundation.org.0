Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12A203B9D
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 17:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0AFB5872FC;
	Mon, 22 Jun 2020 15:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oJSOcmPrSMG; Mon, 22 Jun 2020 15:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8EDC087287;
	Mon, 22 Jun 2020 15:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59102C016F;
	Mon, 22 Jun 2020 15:55:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54C53C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 15:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C092886B0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 15:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Qy1fX738Xka
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 15:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 49F07886A9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592841325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/TWvdWyq1xUujhnrnIglEliiwBVOZjUqDPRZt1W7a0=;
 b=DGcQB0DVqouImlxbCglGL7oSSLsPTgELcBF40oROx71U7LaxAIqRoWQFfp+/mbbmeBAaux
 GKCvNxjtz/5puyb9jwCVCZni+dtSUa7FxFyMRXLqTcFpJLxAHVtFGdGddI/VJWSrRQjATU
 hERL0Dh8KXKf7CFWAgPjW2lPevjN36M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-iSH_p1goOaWxxNKkpZTdvA-1; Mon, 22 Jun 2020 11:55:10 -0400
X-MC-Unique: iSH_p1goOaWxxNKkpZTdvA-1
Received: by mail-wm1-f69.google.com with SMTP id u15so33281wmm.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 08:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5/TWvdWyq1xUujhnrnIglEliiwBVOZjUqDPRZt1W7a0=;
 b=PotL8EDQiyACHhchT0/TnQemPn5BuORuO2YWKJyBuaZp21Sn31N6V4Bq2zfNLIHjDa
 /XuG1FQvbyEnsHF0s/mVeZR/Az/r95EMh5/aUNrXDbBj8akepUy577n+rl8I3eqPcxCS
 gBu8I8X6oD9TVJW3QzaAw/L1L2CZ4x6pj9RMVIfndBm1w4SM8i+aBguZQtM1q7uR6IZh
 MwnF3vTdKUn+zYWmGbMPKU2mnornvA+PWMNh3ucwhauZqtFQvAIv+rRGYKYcnR5xPSc0
 JJ0Ac5j+5tge+acvSvkKY6rKblR6U+IptSDJEv50IrfANNjva51Ypj9Vjv3MAz8XZ12v
 trlg==
X-Gm-Message-State: AOAM531Z3PpLABPoxanXSU93esKh8xST3sE8pSEeULFB50KuxfdiuzC/
 UGONwXDNK/dB7REXoUzHqEQhtZAfh0Un+qmPI/X/SNAt70gW/jlBsC/5ZmzjsiJNbpFqnwjiejN
 k5Eo05cxox1COnp2NA0TkBRcO31CsOnrllbWuhqYsjQ==
X-Received: by 2002:adf:81c8:: with SMTP id 66mr15414793wra.348.1592841308601; 
 Mon, 22 Jun 2020 08:55:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDqUXaq8ZLWjDVbqp55FyjxeMofHg+9iAPblS6Tpzqu1HcZ9tDlKdMVd5PLYKsZyiUVy0W0Q==
X-Received: by 2002:adf:81c8:: with SMTP id 66mr15414773wra.348.1592841308364; 
 Mon, 22 Jun 2020 08:55:08 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id d201sm5593758wmd.34.2020.06.22.08.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:55:07 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:55:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200622114622-mutt-send-email-mst@kernel.org>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <20200611152257.GA1798@char.us.oracle.com>
 <CAJaqyWdwXMX0JGhmz6soH2ZLNdaH6HEdpBM8ozZzX9WUu8jGoQ@mail.gmail.com>
 <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Fri, Jun 19, 2020 at 08:07:57PM +0200, Eugenio Perez Martin wrote:
> On Mon, Jun 15, 2020 at 2:28 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Jun 11, 2020 at 5:22 PM Konrad Rzeszutek Wilk
> > <konrad.wilk@oracle.com> wrote:
> > >
> > > On Thu, Jun 11, 2020 at 07:34:19AM -0400, Michael S. Tsirkin wrote:
> > > > As testing shows no performance change, switch to that now.
> > >
> > > What kind of testing? 100GiB? Low latency?
> > >
> >
> > Hi Konrad.
> >
> > I tested this version of the patch:
> > https://lkml.org/lkml/2019/10/13/42
> >
> > It was tested for throughput with DPDK's testpmd (as described in
> > http://doc.dpdk.org/guides/howto/virtio_user_as_exceptional_path.html)
> > and kernel pktgen. No latency tests were performed by me. Maybe it is
> > interesting to perform a latency test or just a different set of tests
> > over a recent version.
> >
> > Thanks!
> 
> I have repeated the tests with v9, and results are a little bit different:
> * If I test opening it with testpmd, I see no change between versions


OK that is testpmd on guest, right? And vhost-net on the host?

> * If I forward packets between two vhost-net interfaces in the guest
> using a linux bridge in the host:

And here I guess you mean virtio-net in the guest kernel?

>   - netperf UDP_STREAM shows a performance increase of 1.8, almost
> doubling performance. This gets lower as frame size increase.
>   - rests of the test goes noticeably worse: UDP_RR goes from ~6347
> transactions/sec to 5830

OK so it seems plausible that we still have a bug where an interrupt
is delayed. That is the main difference between pmd and virtio.
Let's try disabling event index, and see what happens - that's
the trickiest part of interrupts.



>   - TCP_STREAM goes from ~10.7 gbps to ~7Gbps
>   - TCP_RR from 6223.64 transactions/sec to 5739.44

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
