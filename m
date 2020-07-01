Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1FC210A23
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 13:12:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A247688350;
	Wed,  1 Jul 2020 11:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JM7wgdQm9X4Y; Wed,  1 Jul 2020 11:12:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC03E8AA9B;
	Wed,  1 Jul 2020 11:12:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 876B8C0733;
	Wed,  1 Jul 2020 11:12:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28317C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2382E8AA8F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwiNazFc7dDA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:12:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E211688350
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593601926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yexujkd7auN9ITgPnwA4kXggvTeorMC1CWNzXOrWnvM=;
 b=DOZXDYyKogROTC7ZGQvd+PtNdN342mLgKbkR3zUAyxtnIW4gKJUQOhRrdH9xe0uUjc216n
 2OOp5mZ8xuHTzVXTNO9Xs8IyOsmT13B7L053uzY7Zqi24ayQTIexpbAMD/H1DMbs1V6j1w
 eJdldXoWaQsF11f13neOaZ5IkK9sIGg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-tiRnfj9nOg6K16R5WBsgWA-1; Wed, 01 Jul 2020 07:12:03 -0400
X-MC-Unique: tiRnfj9nOg6K16R5WBsgWA-1
Received: by mail-wr1-f70.google.com with SMTP id i12so19982537wrx.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 04:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yexujkd7auN9ITgPnwA4kXggvTeorMC1CWNzXOrWnvM=;
 b=FKMbAiXyh4+lS1OEe7U7XX2Zx5R3Xa7bbdJU+HeJA3+eDLG9v40dNJ0P6/7U9TiuYq
 gWqUYRrsMKrVb17xnG+zvAsaoZrtYSoX1iM8yQSjRetpjJNSi2RVcEPB4/L/2rYGtDWt
 TFrnicOu17oq23A5RT9g+1juog6BNKGp+pL4zPTTs3C6KgcZy28TiMJZZuoZwOrbIfbw
 bJuHiCeqQkaz8rh7REnw5dgsX8zCSugpm9YP8LVM7bUDlWG1cqq6hhZaiwHCDMGbvgaX
 R6WbuvizWDjGxjy0y2vJ0NECjV42TMn9AmPTWgeMpt/zBqDCrvBgtkNrjqfbl+qPGb9i
 DigQ==
X-Gm-Message-State: AOAM531zvD+bp3ycVYIpuTwUeoGed0b3vZRSDzKG1crL5nUz03bABSAA
 QpygkucncwgtKDYkGHqg3oVGsULrrDwex36K0w/MI3LIk1b0LOjiz37BGgyzhPgvZOFXL4rMU9S
 /3oOOah5jsF/gsj1UTAQ4ZhgL+pjNoX7txTmaV1pctw==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr25236178wma.76.1593601922427; 
 Wed, 01 Jul 2020 04:12:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQMUaayG0vDg3RNtuezDlgxdvof9uLCFzLvN6HKEyQRgj3zoZo7nehIzUAAPphqwvJnljolw==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr25236149wma.76.1593601922091; 
 Wed, 01 Jul 2020 04:12:02 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 140sm1930942wmb.15.2020.07.01.04.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 04:12:01 -0700 (PDT)
Date: Wed, 1 Jul 2020 07:11:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200701071041-mutt-send-email-mst@kernel.org>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <20200611152257.GA1798@char.us.oracle.com>
 <CAJaqyWdwXMX0JGhmz6soH2ZLNdaH6HEdpBM8ozZzX9WUu8jGoQ@mail.gmail.com>
 <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
 <20200622114622-mutt-send-email-mst@kernel.org>
 <CAJaqyWfrf94Gc-DMaXO+f=xC8eD3DVCD9i+x1dOm5W2vUwOcGQ@mail.gmail.com>
 <20200622122546-mutt-send-email-mst@kernel.org>
 <CAJaqyWfbouY4kEXkc6sYsbdCAEk0UNsS5xjqEdHTD7bcTn40Ow@mail.gmail.com>
 <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
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

On Wed, Jul 01, 2020 at 12:43:09PM +0200, Eugenio Perez Martin wrote:
> On Tue, Jun 23, 2020 at 6:15 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Mon, Jun 22, 2020 at 6:29 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 22, 2020 at 06:11:21PM +0200, Eugenio Perez Martin wrote:
> > > > On Mon, Jun 22, 2020 at 5:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Fri, Jun 19, 2020 at 08:07:57PM +0200, Eugenio Perez Martin wrote:
> > > > > > On Mon, Jun 15, 2020 at 2:28 PM Eugenio Perez Martin
> > > > > > <eperezma@redhat.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jun 11, 2020 at 5:22 PM Konrad Rzeszutek Wilk
> > > > > > > <konrad.wilk@oracle.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jun 11, 2020 at 07:34:19AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > > As testing shows no performance change, switch to that now.
> > > > > > > >
> > > > > > > > What kind of testing? 100GiB? Low latency?
> > > > > > > >
> > > > > > >
> > > > > > > Hi Konrad.
> > > > > > >
> > > > > > > I tested this version of the patch:
> > > > > > > https://lkml.org/lkml/2019/10/13/42
> > > > > > >
> > > > > > > It was tested for throughput with DPDK's testpmd (as described in
> > > > > > > http://doc.dpdk.org/guides/howto/virtio_user_as_exceptional_path.html)
> > > > > > > and kernel pktgen. No latency tests were performed by me. Maybe it is
> > > > > > > interesting to perform a latency test or just a different set of tests
> > > > > > > over a recent version.
> > > > > > >
> > > > > > > Thanks!
> > > > > >
> > > > > > I have repeated the tests with v9, and results are a little bit different:
> > > > > > * If I test opening it with testpmd, I see no change between versions
> > > > >
> > > > >
> > > > > OK that is testpmd on guest, right? And vhost-net on the host?
> > > > >
> > > >
> > > > Hi Michael.
> > > >
> > > > No, sorry, as described in
> > > > http://doc.dpdk.org/guides/howto/virtio_user_as_exceptional_path.html.
> > > > But I could add to test it in the guest too.
> > > >
> > > > These kinds of raw packets "bursts" do not show performance
> > > > differences, but I could test deeper if you think it would be worth
> > > > it.
> > >
> > > Oh ok, so this is without guest, with virtio-user.
> > > It might be worth checking dpdk within guest too just
> > > as another data point.
> > >
> >
> > Ok, I will do it!
> >
> > > > > > * If I forward packets between two vhost-net interfaces in the guest
> > > > > > using a linux bridge in the host:
> > > > >
> > > > > And here I guess you mean virtio-net in the guest kernel?
> > > >
> > > > Yes, sorry: Two virtio-net interfaces connected with a linux bridge in
> > > > the host. More precisely:
> > > > * Adding one of the interfaces to another namespace, assigning it an
> > > > IP, and starting netserver there.
> > > > * Assign another IP in the range manually to the other virtual net
> > > > interface, and start the desired test there.
> > > >
> > > > If you think it would be better to perform then differently please let me know.
> > >
> > >
> > > Not sure why you bother with namespaces since you said you are
> > > using L2 bridging. I guess it's unimportant.
> > >
> >
> > Sorry, I think I should have provided more context about that.
> >
> > The only reason to use namespaces is to force the traffic of these
> > netperf tests to go through the external bridge. To test netperf
> > different possibilities than the testpmd (or pktgen or others "blast
> > of frames unconditionally" tests).
> >
> > This way, I make sure that is the same version of everything in the
> > guest, and is a little bit easier to manage cpu affinity, start and
> > stop testing...
> >
> > I could use a different VM for sending and receiving, but I find this
> > way a faster one and it should not introduce a lot of noise. I can
> > test with two VM if you think that this use of network namespace
> > introduces too much noise.
> >
> > Thanks!
> >
> > > > >
> > > > > >   - netperf UDP_STREAM shows a performance increase of 1.8, almost
> > > > > > doubling performance. This gets lower as frame size increase.
> 
> Regarding UDP_STREAM:
> * with event_idx=on: The performance difference is reduced a lot if
> applied affinity properly (manually assigning CPU on host/guest and
> setting IRQs on guest), making them perform equally with and without
> the patch again. Maybe the batching makes the scheduler perform
> better.
> 
> > > > > >   - rests of the test goes noticeably worse: UDP_RR goes from ~6347
> > > > > > transactions/sec to 5830
> 
> * Regarding UDP_RR, TCP_STREAM, and TCP_RR, proper CPU pinning makes
> them perform similarly again, only a very small performance drop
> observed. It could be just noise.
> ** All of them perform better than vanilla if event_idx=off, not sure
> why. I can try to repeat them if you suspect that can be a test
> failure.
> 
> * With testpmd and event_idx=off, if I send from the VM to host, I see
> a performance increment especially in small packets. The buf api also
> increases performance compared with only batching: Sending the minimum
> packet size in testpmd makes pps go from 356kpps to 473 kpps. Sending
> 1024 length UDP-PDU makes it go from 570kpps to 64 kpps.
> 
> Something strange I observe in these tests: I get more pps the bigger
> the transmitted buffer size is. Not sure why.
> 
> ** Sending from the host to the VM does not make a big change with the
> patches in small packets scenario (minimum, 64 bytes, about 645
> without the patch, ~625 with batch and batch+buf api). If the packets
> are bigger, I can see a performance increase: with 256 bits, it goes
> from 590kpps to about 600kpps, and in case of 1500 bytes payload it
> gets from 348kpps to 528kpps, so it is clearly an improvement.
> 
> * with testpmd and event_idx=on, batching+buf api perform similarly in
> both directions.
> 
> All of testpmd tests were performed with no linux bridge, just a
> host's tap interface (<interface type='ethernet'> in xml), with a
> testpmd txonly and another in rxonly forward mode, and using the
> receiving side packets/bytes data. Guest's rps, xps and interrupts,
> and host's vhost threads affinity were also tuned in each test to
> schedule both testpmd and vhost in different processors.
> 
> I will send the v10 RFC with the small changes requested by Stefan and Jason.
> 
> Thanks!
> 

OK so there's a chance you are seeing effects of an aggressive power
management. which tuned profile are you using? It might be helpful
to disable PM/frequency scaling.


> 
> 
> 
> 
> 
> > > > >
> > > > > OK so it seems plausible that we still have a bug where an interrupt
> > > > > is delayed. That is the main difference between pmd and virtio.
> > > > > Let's try disabling event index, and see what happens - that's
> > > > > the trickiest part of interrupts.
> > > > >
> > > >
> > > > Got it, will get back with the results.
> > > >
> > > > Thank you very much!
> > > >
> > > > >
> > > > >
> > > > > >   - TCP_STREAM goes from ~10.7 gbps to ~7Gbps
> > > > > >   - TCP_RR from 6223.64 transactions/sec to 5739.44
> > > > >
> > >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
