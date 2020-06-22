Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB7203C90
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 18:29:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 178448874A;
	Mon, 22 Jun 2020 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJZMGut+uvqa; Mon, 22 Jun 2020 16:29:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 06E64892AB;
	Mon, 22 Jun 2020 16:29:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2E44C016F;
	Mon, 22 Jun 2020 16:29:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF487C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A35A987252
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnoCpq3aGe_1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:29:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6671D8723F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592843377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FzLtoFQh/vN8wW8Srx1684Gpm2Q4p3etHyJcn3zpZ2o=;
 b=b1icpGRDlat9MMUtdOfCI9KIwjMdefSQjpiMrVDsFJ7Sf1+Uk3SuD4xq44z9xc7BhcPcTe
 r8ZFD2EsNuUf00jUJ5c+9Yc8QSxIk7olHIUul4E4MDUaCFRWeUBjQCmQEDl6olSx5GMYif
 X6CzhxL1dfZ7XTc2rCzJl1v16sVYAG0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-RnmWjYkWPzCVKbzDs7LhSw-1; Mon, 22 Jun 2020 12:29:32 -0400
X-MC-Unique: RnmWjYkWPzCVKbzDs7LhSw-1
Received: by mail-wr1-f71.google.com with SMTP id i14so187530wru.17
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FzLtoFQh/vN8wW8Srx1684Gpm2Q4p3etHyJcn3zpZ2o=;
 b=D0zsLzZXuWZo/pXquxJRTfVGrJ7/L60KMqhT6bmsjKPY1scIUeUWN2L2lKPktvrUFV
 scaVaOWd4dAjHjAB959/BsldVtFaW0niHoBrGTL7o4XQ/ke55kLTGEgneuurRqzCPz4z
 bh0rtQAP0OW+DlshH7y1CoGvF0spSPMPobG6LdYnENe084ljItovc4Qup6LSlRn7WLXp
 AdpleFY5WJsM87Lh1dxf0oAccuYPJY7TkUTe5KIpeUmz0Za6mkHO3c3Fg1XwKVSTXfXg
 9uLLSHKgPslmycCham4gA8VGHqu72Yf0tqW2NzL2kTrE6hcshs9U4a+Em+GPFC0H5Q0i
 KhWw==
X-Gm-Message-State: AOAM531lAe9P+96JU2dLxiD9dyohO8grlkY7kYaZNl66i3wbSpSRyabm
 tMMSuoPoNaVOsnPD0J9nBSAxZW2UxSabMkKf3Q0jEzLYE/AYcNqBhVQwgqxch1wz1ACXMzAZz4F
 eytx9up2mMEHlXjWvfVEl450bWG4ghN0lqovcBOLGwg==
X-Received: by 2002:a5d:470a:: with SMTP id y10mr7567524wrq.405.1592843371379; 
 Mon, 22 Jun 2020 09:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTk56uu9uLED/XFyQTjpJIlBSf9Yjq+4mD8Dsvqij6CkK9q6rGvTmvotw6Je15SfiT50Mhig==
X-Received: by 2002:a5d:470a:: with SMTP id y10mr7567504wrq.405.1592843371111; 
 Mon, 22 Jun 2020 09:29:31 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id x205sm98811wmx.21.2020.06.22.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 09:29:30 -0700 (PDT)
Date: Mon, 22 Jun 2020 12:29:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200622122546-mutt-send-email-mst@kernel.org>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <20200611152257.GA1798@char.us.oracle.com>
 <CAJaqyWdwXMX0JGhmz6soH2ZLNdaH6HEdpBM8ozZzX9WUu8jGoQ@mail.gmail.com>
 <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
 <20200622114622-mutt-send-email-mst@kernel.org>
 <CAJaqyWfrf94Gc-DMaXO+f=xC8eD3DVCD9i+x1dOm5W2vUwOcGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfrf94Gc-DMaXO+f=xC8eD3DVCD9i+x1dOm5W2vUwOcGQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
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

On Mon, Jun 22, 2020 at 06:11:21PM +0200, Eugenio Perez Martin wrote:
> On Mon, Jun 22, 2020 at 5:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jun 19, 2020 at 08:07:57PM +0200, Eugenio Perez Martin wrote:
> > > On Mon, Jun 15, 2020 at 2:28 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Thu, Jun 11, 2020 at 5:22 PM Konrad Rzeszutek Wilk
> > > > <konrad.wilk@oracle.com> wrote:
> > > > >
> > > > > On Thu, Jun 11, 2020 at 07:34:19AM -0400, Michael S. Tsirkin wrote:
> > > > > > As testing shows no performance change, switch to that now.
> > > > >
> > > > > What kind of testing? 100GiB? Low latency?
> > > > >
> > > >
> > > > Hi Konrad.
> > > >
> > > > I tested this version of the patch:
> > > > https://lkml.org/lkml/2019/10/13/42
> > > >
> > > > It was tested for throughput with DPDK's testpmd (as described in
> > > > http://doc.dpdk.org/guides/howto/virtio_user_as_exceptional_path.html)
> > > > and kernel pktgen. No latency tests were performed by me. Maybe it is
> > > > interesting to perform a latency test or just a different set of tests
> > > > over a recent version.
> > > >
> > > > Thanks!
> > >
> > > I have repeated the tests with v9, and results are a little bit different:
> > > * If I test opening it with testpmd, I see no change between versions
> >
> >
> > OK that is testpmd on guest, right? And vhost-net on the host?
> >
> 
> Hi Michael.
> 
> No, sorry, as described in
> http://doc.dpdk.org/guides/howto/virtio_user_as_exceptional_path.html.
> But I could add to test it in the guest too.
> 
> These kinds of raw packets "bursts" do not show performance
> differences, but I could test deeper if you think it would be worth
> it.

Oh ok, so this is without guest, with virtio-user.
It might be worth checking dpdk within guest too just
as another data point.

> > > * If I forward packets between two vhost-net interfaces in the guest
> > > using a linux bridge in the host:
> >
> > And here I guess you mean virtio-net in the guest kernel?
> 
> Yes, sorry: Two virtio-net interfaces connected with a linux bridge in
> the host. More precisely:
> * Adding one of the interfaces to another namespace, assigning it an
> IP, and starting netserver there.
> * Assign another IP in the range manually to the other virtual net
> interface, and start the desired test there.
> 
> If you think it would be better to perform then differently please let me know.


Not sure why you bother with namespaces since you said you are
using L2 bridging. I guess it's unimportant.

> >
> > >   - netperf UDP_STREAM shows a performance increase of 1.8, almost
> > > doubling performance. This gets lower as frame size increase.
> > >   - rests of the test goes noticeably worse: UDP_RR goes from ~6347
> > > transactions/sec to 5830
> >
> > OK so it seems plausible that we still have a bug where an interrupt
> > is delayed. That is the main difference between pmd and virtio.
> > Let's try disabling event index, and see what happens - that's
> > the trickiest part of interrupts.
> >
> 
> Got it, will get back with the results.
> 
> Thank you very much!
> 
> >
> >
> > >   - TCP_STREAM goes from ~10.7 gbps to ~7Gbps
> > >   - TCP_RR from 6223.64 transactions/sec to 5739.44
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
