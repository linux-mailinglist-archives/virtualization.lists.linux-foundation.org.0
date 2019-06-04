Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA134B8E
	for <lists.virtualization@lfdr.de>; Tue,  4 Jun 2019 17:06:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ECB89A5E;
	Tue,  4 Jun 2019 15:06:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E04B86D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 15:06:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4DA3A6D6
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 15:06:48 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x54F44AJ112320 for <virtualization@lists.linux-foundation.org>;
	Tue, 4 Jun 2019 11:06:46 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2swty5r7qq-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Tue, 04 Jun 2019 11:06:44 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Tue, 4 Jun 2019 16:06:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 4 Jun 2019 16:06:22 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x54F6KhA35258566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 4 Jun 2019 15:06:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A69E542042;
	Tue,  4 Jun 2019 15:06:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 079E442041;
	Tue,  4 Jun 2019 15:06:20 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.145])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  4 Jun 2019 15:06:19 +0000 (GMT)
Date: Tue, 4 Jun 2019 17:06:18 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 4/8] s390/airq: use DMA memory for adapter interrupts
In-Reply-To: <20190604165120.5afdce78.cohuck@redhat.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-5-mimu@linux.ibm.com>
	<20190603172740.1023e078.cohuck@redhat.com>
	<20190604152256.158d688c.pasic@linux.ibm.com>
	<20190604165120.5afdce78.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19060415-0028-0000-0000-000003754689
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060415-0029-0000-0000-000024351F18
Message-Id: <20190604170618.74f2c561.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-04_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906040098
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
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

On Tue, 4 Jun 2019 16:51:20 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 4 Jun 2019 15:22:56 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Mon, 3 Jun 2019 17:27:40 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > > Apologies if that already has been answered (and I missed it in my mail
> > > pile...), but two things had come to my mind previously:
> > > 
> > > - CHSC... does anything need to be done there? Last time I asked:
> > >   "Anyway, css_bus_init() uses some chscs
> > >    early (before cio_dma_pool_init), so we could not use the pools
> > >    there, even if we wanted to. Do chsc commands either work, or else
> > >    fail benignly on a protected virt guest?"  
> > 
> > Protected virt won't support all CHSC. The supported ones won't requre
> > use of shared memory. So we are fine.
> 
> I suppose the supported ones are the sync chscs that use the chsc area
> as a direct parameter (and therefore are handled similarly to the other
> I/O instructions that supply a direct parameter)? I don't think we care
> about async chscs in KVM/QEMU anyway, as we don't even emulate chsc
> subchannels :) (And IIRC, you don't get chsc subchannels in z/VM
> guests, either.)

Nod.

> 
> > 
> > > - PCI indicators... does this interact with any dma configuration on
> > >   the pci device? (I know pci is not supported yet, and I don't really
> > >   expect any problems.)
> > >   
> > 
> > It does but, I'm pretty confident we don't have a problem with PCI. IMHO
> > Sebastian is the guy who needs to be paranoid about this, and he r-b-ed
> > the respective patches.
> 
> Just wanted to make sure that this was on the radar. You guys are
> obviously in a better position than me to judge this :)
> 
> Anyway, I do not intend to annoy with those questions, it's just hard
> to get a feel if there are areas that still need care if you don't have
> access to the documentation for this... if you tell me that you are
> aware of it and it should work, that's fine for me.
> 

The questions are important. It is just the not so unusual problem with
the availability of public documentation that makes things a bit
difficult for me as well.

And sorry if these questions were ignored in the past. I did not have
the bandwidth to take care of all the questions properly, but I did
enough so that the other guys never knew if they need to engage or not.

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
