Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E22233C9
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 14:34:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3606DCE5;
	Mon, 20 May 2019 12:34:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E4F9CE5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 12:34:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC616A3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 12:34:21 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4KCX17R096560 for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 08:34:21 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2skrw214bw-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 08:34:20 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Mon, 20 May 2019 13:34:18 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 20 May 2019 13:34:15 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4KCYDkJ50528316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 20 May 2019 12:34:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B55EE52050;
	Mon, 20 May 2019 12:34:13 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.57.34])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F2BF35204E;
	Mon, 20 May 2019 12:34:12 +0000 (GMT)
Date: Mon, 20 May 2019 14:34:11 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
In-Reply-To: <20190520122143.259ff8df.cohuck@redhat.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<20190513114136.783c851c.cohuck@redhat.com>
	<20190515225158.301af387.pasic@linux.ibm.com>
	<20190516082928.1371696b.cohuck@redhat.com>
	<20190518201100.0fd07d7f.pasic@linux.ibm.com>
	<20190520122143.259ff8df.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19052012-4275-0000-0000-00000336AF69
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052012-4276-0000-0000-000038463FE6
Message-Id: <20190520143411.15130af3.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905200086
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, 20 May 2019 12:21:43 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Sat, 18 May 2019 20:11:00 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Thu, 16 May 2019 08:29:28 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > 
> > > On Wed, 15 May 2019 22:51:58 +0200
> > > Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > Don't like the second sentence. How about "It handles neither QDIO
> > in the common code, nor any device type specific stuff (like channel
> > programs constructed by the DADS driver)."
> 
> Sounds good to me (with s/DADS/DASD/ :)
> 

Of course!

> > > > A side note: making the subchannel device 'own' the DMA stuff of a
> > > > ccw device (something that was discussed in the RFC thread) is tricky
> > > > because the ccw device may outlive the subchannel (all that orphan
> > > > stuff).  
> > > 
> > > Yes, that's... eww. Not really a problem for virtio-ccw devices (which
> > > do not support the disconnected state), but can we make DMA and the
> > > subchannel moving play nice with each other at all?
> > >   
> > 
> > I don't quite understand the question. This series does not have any
> > problems with that AFAIU. Can you please clarify?
> 
> Wait, weren't you saying that there actually is a problem?
>

No, what I tried to say is: if we tried to make all the dma mem belong to
the subchannel device, we would have a problem. It appeared as a
tempting opportunity for consolidation, but I decided to not do it.

> We seem to have the following situation:
> - the device per se is represented by the ccw device
> - the subchannel is the means of communication, and dma is tied to the
>   (I/O ?) subchannel

It is not. When for example a virtio-ccw device talks to the device
using a channel program, the dma mem hosting the channel program belongs
to the ccw device and not to the subchannel.

In fact everything but the stuff in io_priv->dma_area belongs to the ccw
device.

> - the machine check handling code may move a ccw device to a different
>   subchannel, or even to a fake subchannel (orphanage handling)
> 

Right!

> The moving won't happen with virtio-ccw devices (as they do not support
> the disconnected state, which is a prereq for being moved around), but
> at a glance, this looks like it is worth some more thought.
> 
> - Are all (I/O) subchannels using e.g. the same dma size? (TBH, that
>   question sounds a bit silly: that should be a property belonging to
>   the ccw device, shouldn't it?)
> - What dma properties does the fake subchannel have? (Probably none, as
>   its only purpose is to serve as a parent for otherwise parentless
>   disconnected ccw devices, and is therefore not involved in any I/O.)
> - There needs to be some kind of handling in the machine check code, I
>   guess? We would probably need a different allocation if we end up at
>   a different subchannel?
> 

Basically nothing changes with mem ownership, except that some bits are
dma memory now. Should I provide a more detailed answer to the
questions above?

> I think we can assume that the dma size is at most 31 bits (since that
> is what the common I/O layer needs); but can we also assume that it
> will always be at least 31 bits?
> 

You mean dma_mas by dma size?

> My take on this is that we should be sure that we're not digging
> ourselves a hole that will be hard to get out of again should we want to
> support non-virtio-ccw in the future, not that the current
> implementation is necessarily broken.
> 

I agree!

Regards,
Hali

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
