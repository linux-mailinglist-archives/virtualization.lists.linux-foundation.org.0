Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0081BFFFA
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 17:20:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E60B86E23;
	Thu, 30 Apr 2020 15:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3okySe_jiOl; Thu, 30 Apr 2020 15:20:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10DC186DEA;
	Thu, 30 Apr 2020 15:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02DEFC016F;
	Thu, 30 Apr 2020 15:20:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37AEBC016F;
 Thu, 30 Apr 2020 15:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1EF2686DEA;
 Thu, 30 Apr 2020 15:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdcSeTkKZqIM; Thu, 30 Apr 2020 15:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C39986DDA;
 Thu, 30 Apr 2020 15:19:58 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03UFJh0b107342;
 Thu, 30 Apr 2020 15:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=BlAQ+cr28c3G7QtbaaRKhxV/AvgpV2lx9FrBL1fLgEw=;
 b=LHpVGc/hSWEqEyg2SK8MhCm7H9iX9+gDrfb94BbQlA18Q05XwbIkcwaInirP4E7lzBQh
 dreySwYT2VAGG7p3q+GTOH6ZIcl3tDs6YPeJ8V4S33aQgkw+jyKrDxxBgcXo4gJnGb3M
 TA1bRfDzzLS8LpfCLm3I29zMDcegOC/2InAzgB9tzlk640UicYVNqbZ69nhiqOc3dHqX
 7ce1+aiANeksvHKnsJ3qrXnRKtiLuxVoygJlinn3UrYGgcYY2Fbv80BA9tT3/+7QdgpD
 S+KG/go1/ZVO2C6qVZzKn2iLHGUWM2EjVDovodzouUiifkg+2H3QlvwLoIO6OnfjlgCU DQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 30p2p0hhvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 15:19:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03UFISuO077365;
 Thu, 30 Apr 2020 15:19:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 30qtkwjy0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 15:19:49 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03UFJlsc012797;
 Thu, 30 Apr 2020 15:19:48 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Apr 2020 08:19:47 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 90C566A00FC; Thu, 30 Apr 2020 11:20:09 -0400 (EDT)
Date: Thu, 30 Apr 2020 11:20:08 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200430152008.GB872@char.us.oracle.com>
References: <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
 <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
 <20200429004531-mutt-send-email-mst@kernel.org>
 <b676430c-65b3-096e-ca48-ceebf10f4b28@linux.intel.com>
 <20200429023842-mutt-send-email-mst@kernel.org>
 <20200429094410.GD5097@quicinc.com>
 <20200429055125-mutt-send-email-mst@kernel.org>
 <20200429100953.GE5097@quicinc.com>
 <20200429061621-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429061621-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9607
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004300124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9607
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004300124
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, will@kernel.org,
 jan.kiszka@siemens.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>,
 christoffer.dall@arm.com, pratikp@codeaurora.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
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

On Wed, Apr 29, 2020 at 06:20:48AM -0400, Michael S. Tsirkin wrote:
> On Wed, Apr 29, 2020 at 03:39:53PM +0530, Srivatsa Vaddagiri wrote:
> > That would still not work I think where swiotlb is used for pass-thr devices
> > (when private memory is fine) as well as virtio devices (when shared memory is
> > required).
> 
> So that is a separate question. When there are multiple untrusted
> devices, at the moment it looks like a single bounce buffer is used.
> 
> Which to me seems like a security problem, I think we should protect
> untrusted devices from each other.

There are two DMA pools code in Linux already - the TTM one for graphics
and the mm/dmapool.c - could those be used instead? Or augmented at least?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
