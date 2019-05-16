Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0A20865
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 15:43:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D28E1E36;
	Thu, 16 May 2019 13:42:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ACA9EDF2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:42:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 40520883
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:42:55 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4GDXSsi062285 for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 09:42:54 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sh8mv93jy-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 09:42:53 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Thu, 16 May 2019 14:42:52 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 16 May 2019 14:42:49 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4GDgld519726486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 16 May 2019 13:42:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF78352057;
	Thu, 16 May 2019 13:42:47 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.159.11])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D2E7C5204E;
	Thu, 16 May 2019 13:42:46 +0000 (GMT)
Date: Thu, 16 May 2019 15:42:45 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
In-Reply-To: <20190516083228.0cc5b489.cohuck@redhat.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<20190513114136.783c851c.cohuck@redhat.com>
	<d0ffefec-a14e-ee83-0aae-df288c3ffda4@linux.ibm.com>
	<20190515230817.2f8a8a5d.pasic@linux.ibm.com>
	<20190516083228.0cc5b489.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051613-0012-0000-0000-0000031C5CC0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051613-0013-0000-0000-00002154FE5E
Message-Id: <20190516154245.4a0a84f7.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-16_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905160091
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>
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

On Thu, 16 May 2019 08:32:28 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 15 May 2019 23:08:17 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Tue, 14 May 2019 10:47:34 -0400
> > "Jason J. Herne" <jjherne@linux.ibm.com> wrote:
> 
> > > Are we 
> > > worried that virtio data structures are going to be a burden on the 31-bit address space?
> > > 
> > >   
> > 
> > That is a good question I can not answer. Since it is currently at least
> > a page per queue (because we use dma direct, right Mimu?), I am concerned
> > about this.
> > 
> > Connie, what is your opinion?
> 
> Yes, running into problems there was one of my motivations for my
> question. I guess it depends on the number of devices and how many
> queues they use. The problem is that it affects not only protected virt
> guests, but all guests.
> 

Unless things are about to change only devices that have
VIRTIO_F_IOMMU_PLATFORM are affected. So it does not necessarily affect
not protected virt guests. (With prot virt we have to use
VIRTIO_F_IOMMU_PLATFORM.)

If it were not like this, I would be much more worried.

@Mimu: Could you please discuss this problem with the team? It might be
worth considering to go back to the design of the RFC (i.e. cio/ccw stuff
allocated from a common cio dma pool which gives you 31 bit addressable
memory, and 64 bit dma mask for a ccw device of a virtio device).

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
