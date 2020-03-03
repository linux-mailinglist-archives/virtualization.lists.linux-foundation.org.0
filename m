Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2D1177CAC
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 18:02:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73D7485A56;
	Tue,  3 Mar 2020 17:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6-Hbmuu8sCL; Tue,  3 Mar 2020 17:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E865C85D7E;
	Tue,  3 Mar 2020 17:02:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBB48C013E;
	Tue,  3 Mar 2020 17:02:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BABAC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 17:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2743E81EE4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 17:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5N9QBoBIOOqc
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 17:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3557A81E7B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 17:02:30 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023GoXYe008541
 for <virtualization@lists.linux-foundation.org>; Tue, 3 Mar 2020 12:02:29 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmu5e59e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 12:02:28 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Tue, 3 Mar 2020 17:02:26 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 17:02:23 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 023H2M4V37880164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 17:02:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFC684C052;
 Tue,  3 Mar 2020 17:02:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 823854C04A;
 Tue,  3 Mar 2020 17:02:21 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.80])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Mar 2020 17:02:21 +0000 (GMT)
Date: Tue, 3 Mar 2020 18:02:20 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] virtio-blk: improve handling of DMA mapping failures
In-Reply-To: <20200303094909-mutt-send-email-mst@kernel.org>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200303151252.59d45e86.pasic@linux.ibm.com>
 <20200303094909-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20030317-4275-0000-0000-000003A80899
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030317-4276-0000-0000-000038BD117E
Message-Id: <20200303180220.7e38f9fd.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_05:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030116
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
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

On Tue, 3 Mar 2020 09:49:21 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Mar 03, 2020 at 03:12:52PM +0100, Halil Pasic wrote:
> > On Thu, 13 Feb 2020 13:37:26 +0100
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> > 
> > > Two patches are handling new edge cases introduced by doing DMA mappings
> > > (which can fail) in virtio core.
> > > 
> > > I stumbled upon this while stress testing I/O for Protected Virtual
> > > Machines. I deliberately chose a tiny swiotlb size and have generated
> > > load with fio. With more than one virtio-blk disk in use I experienced
> > > hangs.
> > > 
> > > The goal of this series is to fix those hangs.
> > > 
> > > Halil Pasic (2):
> > >   virtio-blk: fix hw_queue stopped on arbitrary error
> > >   virtio-blk: improve virtqueue error to BLK_STS
> > > 
> > >  drivers/block/virtio_blk.c | 17 ++++++++++++-----
> > >  1 file changed, 12 insertions(+), 5 deletions(-)
> > > 
> > > 
> > > base-commit: 39bed42de2e7d74686a2d5a45638d6a5d7e7d473
> > 
> > ping
> > 
> > Hi Michael, hi Jason,
> > 
> > I got some favorable reviews for this, but AFAIK I got nothing form the
> > maintainers yet.
> > 
> > Is some of you going to pick these?
> > 
> > Regards,
> > Halil
> 
> I've queued this, thanks!
> 

Thank you!

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
