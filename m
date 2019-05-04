Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D03213A8B
	for <lists.virtualization@lfdr.de>; Sat,  4 May 2019 16:04:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C70C94230;
	Sat,  4 May 2019 14:04:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 578E3422C
	for <virtualization@lists.linux-foundation.org>;
	Sat,  4 May 2019 14:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E25C2875
	for <virtualization@lists.linux-foundation.org>;
	Sat,  4 May 2019 14:03:51 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x44E1SoM036925 for <virtualization@lists.linux-foundation.org>;
	Sat, 4 May 2019 10:03:50 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2s96xa18sr-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Sat, 04 May 2019 10:03:50 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Sat, 4 May 2019 15:03:48 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sat, 4 May 2019 15:03:44 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x44E3gOq59965526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 4 May 2019 14:03:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BD2442047;
	Sat,  4 May 2019 14:03:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA2B42041;
	Sat,  4 May 2019 14:03:41 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.34.191])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat,  4 May 2019 14:03:41 +0000 (GMT)
Date: Sat, 4 May 2019 16:03:40 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>
Subject: Re: [PATCH 01/10] virtio/s390: use vring_create_virtqueue
In-Reply-To: <20190503160421-mutt-send-email-mst@kernel.org>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-2-pasic@linux.ibm.com>
	<20190503111724.70c6ec37.cohuck@redhat.com>
	<20190503160421-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050414-0012-0000-0000-0000031841BC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050414-0013-0000-0000-00002150B6D2
Message-Id: <20190504160340.29f17b98.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-04_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905040094
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>,
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

On Fri, 3 May 2019 16:04:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, May 03, 2019 at 11:17:24AM +0200, Cornelia Huck wrote:
> > On Fri, 26 Apr 2019 20:32:36 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> > 
> > > The commit 2a2d1382fe9d ("virtio: Add improved queue allocation API")
> > > establishes a new way of allocating virtqueues (as a part of the effort
> > > that taught DMA to virtio rings).
> > > 
> > > In the future we will want virtio-ccw to use the DMA API as well.
> > > 
> > > Let us switch from the legacy method of allocating virtqueues to
> > > vring_create_virtqueue() as the first step into that direction.
> > > 
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > ---
> > >  drivers/s390/virtio/virtio_ccw.c | 30 +++++++++++-------------------
> > >  1 file changed, 11 insertions(+), 19 deletions(-)
> > 
> > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > 
> > I'd vote for merging this patch right away for 5.2.
> 
> So which tree is this going through? mine?
> 

Christian, what do you think? If the whole series is supposed to go in
in one go (which I hope it is), via Martin's tree could be the simplest
route IMHO.

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
