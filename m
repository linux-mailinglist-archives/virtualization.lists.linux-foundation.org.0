Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F1F89D
	for <lists.virtualization@lfdr.de>; Tue, 30 Apr 2019 14:17:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA5361209;
	Tue, 30 Apr 2019 12:17:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A216611F7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:16:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E86845F4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:16:35 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UC4PZN126081; Tue, 30 Apr 2019 12:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
	bh=stcZtfGfCo/IzUJLtd3HedLv0tCRRKGPYBwhTGzBWVY=;
	b=v9STOoOUwU++Z0fTdUDYGjcBy8B/HAOLzwTvQOdfHnyObjFF9dEg9dAPmT8oGzWEElr6
	kjG7WjFYmO0vGRYeH+zK/fDp1OYva1rJf+HR/tzB4KenlknrQRXHIbnwdcf27NYDGGkY
	4vZeVW7ZHCpNcmJumqd/KP+l8IJGyzQR3YwPj8q+jGmPonWubGVxC8RzrU+JMWJjwmY8
	WCMXpc1T4pYLXyYCO69PqMWZ2KaFgI4/GhAI706fRQxF4MsOvQVW6tdoQcrfQ7RdTuC4
	MH2l7qUSygkbZhoCYvuEUc/kw82lL/lBu2o61/7xN+bKoCVwHnRGitrD1ZUsXikIIScV
	cA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 2s5j5u0t3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 12:16:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UCFbj3126300; Tue, 30 Apr 2019 12:16:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 2s4yy9gjc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 12:16:34 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UCGWTM017802;
	Tue, 30 Apr 2019 12:16:33 GMT
Received: from lap1 (/77.138.183.59) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 30 Apr 2019 05:16:32 -0700
Date: Tue, 30 Apr 2019 15:16:25 +0300
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [Qemu-devel] [RFC 0/3] VirtIO RDMA
Message-ID: <20190430121624.GA8708@lap1>
References: <20190411110157.14252-1-yuval.shaia@oracle.com>
	<20190411190215.2163572e.cohuck@redhat.com>
	<20190415103546.GA6854@lap1>
	<e73e03c2-ea2b-6ffc-cd23-e8e44d42ce80@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e73e03c2-ea2b-6ffc-cd23-e8e44d42ce80@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1904300080
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1904300080
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, linux-rdma@vger.kernel.org,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, jgg@mellanox.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Apr 19, 2019 at 01:16:06PM +0200, Hannes Reinecke wrote:
> On 4/15/19 12:35 PM, Yuval Shaia wrote:
> > On Thu, Apr 11, 2019 at 07:02:15PM +0200, Cornelia Huck wrote:
> > > On Thu, 11 Apr 2019 14:01:54 +0300
> > > Yuval Shaia <yuval.shaia@oracle.com> wrote:
> > > =

> > > > Data center backends use more and more RDMA or RoCE devices and mor=
e and
> > > > more software runs in virtualized environment.
> > > > There is a need for a standard to enable RDMA/RoCE on Virtual Machi=
nes.
> > > > =

> > > > Virtio is the optimal solution since is the de-facto para-virtualiz=
aton
> > > > technology and also because the Virtio specification
> > > > allows Hardware Vendors to support Virtio protocol natively in orde=
r to
> > > > achieve bare metal performance.
> > > > =

> > > > This RFC is an effort to addresses challenges in defining the RDMA/=
RoCE
> > > > Virtio Specification and a look forward on possible implementation
> > > > techniques.
> > > > =

> > > > Open issues/Todo list:
> > > > List is huge, this is only start point of the project.
> > > > Anyway, here is one example of item in the list:
> > > > - Multi VirtQ: Every QP has two rings and every CQ has one. This me=
ans that
> > > >    in order to support for example 32K QPs we will need 64K VirtQ. =
Not sure
> > > >    that this is reasonable so one option is to have one for all and
> > > >    multiplex the traffic on it. This is not good approach as by des=
ign it
> > > >    introducing an optional starvation. Another approach would be mu=
lti
> > > >    queues and round-robin (for example) between them.
> > > > =

> Typically there will be a one-to-one mapping between QPs and CPUs (on the
> guest). So while one would need to be prepared to support quite some QPs,
> the expectation is that the actual number of QPs used will be rather low.
> In a similar vein, multiplexing QPs would be defeating the purpose, as the
> overall idea was to have _independent_ QPs to enhance parallelism.

Since Jason already addresses the issue then i'll skip it.

> =

> > > > Expectations from this posting:
> > > > In general, any comment is welcome, starting from hey, drop this as=
 it is a
> > > > very bad idea, to yeah, go ahead, we really want it.
> > > > Idea here is that since it is not a minor effort i first want to kn=
ow if
> > > > there is some sort interest in the community for such device.
> > > =

> > > My first reaction is: Sounds sensible, but it would be good to have a
> > > spec for this :)
> > > =

> > > You'll need a spec if you want this to go forward anyway, so at least=
 a
> > > sketch would be good to answer questions such as how many virtqueues
> > > you use for which purpose, what is actually put on the virtqueues,
> > > whether there are negotiable features, and what the expectations for
> > > the device and the driver are. It also makes it easier to understand
> > > how this is supposed to work in practice.
> > > =

> > > If folks agree that this sounds useful, the next step would be to
> > > reserve an id for the device type.
> > =

> > Thanks for the tips, will sure do that, it is that first i wanted to ma=
ke
> > sure there is a use case here.
> > =

> > Waiting for any feedback from the community.
> > =

> I really do like the ides; in fact, it saved me from coding a similar thi=
ng
> myself :-)

Isn't it the great thing with open source :-)

> =

> However, I'm still curious about the overall intent of this driver. Where
> would the I/O be routed _to_ ?
> It's nice that we have a virtualized driver, but this driver is
> intended to do I/O (even if it doesn't _do_ any I/O ATM :-)
> And this I/O needs to be send to (and possibly received from)
> something.

Idea is to have a virtio-rdma device emulation (patch #2) on host that will
relay the traffic to the real HW on host.

It will be good to have design that will allow Virtio-HW to be plugged to
the host and use the same driver. In this case the emulated device would
not be needed - the driver will "attach" to the Virtqueue exposed by the
virtio-HW instead of the emulated RDMA device.

I don't know of any public virtio-rdma HW.

> =

> So what exactly is this something?
> An existing piece of HW on the host?
> If so, wouldn't it be more efficient to use vfio, either by using SR-IOV =
or
> by using virtio-mdev?

vfio needs to be implemented by every HW vendor where this approach is a
generic one that is not depended on the HW.

SV-IOV has it's limitations.

And with virtio-mdev, sorry but do not know, can you elaborate more?

> =

> Another guest?

No

> If so, how would we route the I/O from one guest to the other?
> Shared memory? Implementing a full-blown RDMA switch in qemu?
> =

> Oh, and I would _love_ to have a discussion about this at KVM Forum.
> Maybe I'll manage to whip up guest-to-guest RDMA connection using ivshmem
> ... let's see.

Well, I've posted a proposal for a talk, lets see if it'll be accepted.

> =

> Cheers,
> =

> Hannes
> -- =

> Dr. Hannes Reinecke            Teamlead Storage & Networking
> hare@suse.de                              +49 911 74053 688
> SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
> GF: Felix Imend=F6rffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG N=FCrnberg)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
