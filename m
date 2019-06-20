Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C24DD09
	for <lists.virtualization@lfdr.de>; Thu, 20 Jun 2019 23:53:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 28D93ACD;
	Thu, 20 Jun 2019 21:52:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C56D5ACD
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 21:52:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6E76AE6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 21:52:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5KLmcVH098536; Thu, 20 Jun 2019 21:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : references : date : in-reply-to : message-id : mime-version :
	content-type; s=corp-2018-07-02;
	bh=kDQao6pEV9HdsFlEB4nEftCDUPOrB/eF7wS+pHAhRRw=;
	b=h3QxGgfYliCuHMG24Vd/aSTO0WiOkw1pba+5vBNAdpNfO8gWbU+9BHoY06+BRfY4/rzs
	fZphZf30Cgc9C5j2WZjCIcGaZfscUXuJmGUGEtuwyF1ZF/vnDvKoinUjZFe5GO/VRi2Z
	+8I0tB3m0cETV26m2a2bslk8/O+NQ1rlrKaIMcr6C65ISsArrvvvQAIA2G0Zx0OPfqJ0
	oTfkNlcbuChQK61JXYnobxMzlMStz1GD3x5b4WMNPBo5QZa74rC1z0r99Wb720fKOnEq
	POInXBaWgmaJsN5GNC3D2PythRNUBOBNI3a9PrXWq9z/hiUX5GaitggBoYiTXKL456Am
	rQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2t7809keu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2019 21:52:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5KLpHkr119716; Thu, 20 Jun 2019 21:52:52 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 2t7rdxda0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2019 21:52:52 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5KLqoHC014433;
	Thu, 20 Jun 2019 21:52:50 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 20 Jun 2019 14:52:49 -0700
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH 1/1] scsi: virtio_scsi: remove unused 'affinity_hint_set'
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <1560930739-25692-1-git-send-email-dongli.zhang@oracle.com>
Date: Thu, 20 Jun 2019 17:52:46 -0400
In-Reply-To: <1560930739-25692-1-git-send-email-dongli.zhang@oracle.com>
	(Dongli Zhang's message of "Wed, 19 Jun 2019 15:52:19 +0800")
Message-ID: <yq1imszrkk1.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9294
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=966
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906200156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9294
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906200156
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, mst@redhat.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com, jejb@linux.ibm.com
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


Dongli,

> The 'affinity_hint_set' is not used any longer since
> commit 0d9f0a52c8b9 ("virtio_scsi: use virtio IRQ affinity").

Applied to 5.3/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
