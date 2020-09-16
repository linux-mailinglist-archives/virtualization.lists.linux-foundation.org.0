Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528F26B989
	for <lists.virtualization@lfdr.de>; Wed, 16 Sep 2020 03:53:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 053DF86968;
	Wed, 16 Sep 2020 01:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIGf6Q8fegfh; Wed, 16 Sep 2020 01:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3EB886958;
	Wed, 16 Sep 2020 01:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EF55C0051;
	Wed, 16 Sep 2020 01:53:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91443C0051
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 01:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 61C1F22FB9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 01:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPnb1OM94d1v
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 01:53:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by silver.osuosl.org (Postfix) with ESMTPS id BA17222D22
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 01:53:18 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08G1molB146115;
 Wed, 16 Sep 2020 01:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=ECh2MOTmhtTfYZyfuT4yJTL2a4p1wqNmCrWKl3fPcS8=;
 b=zTLFMYai5ScmwCtq04/oHxEbvGXr6UFvjNNnNUO4jqd6neMj2JnIlyDW2S3sPJ/WapxD
 w9puNsCx9PGUDgTGQxRzMD9y27qiKq3naFpDriZf7pgH6mw2pMhd3M+zi40/BqKO9iNc
 EvfrV4iF2JMGDu59P33Dc0RQKpvQ6WzjSGv+vUJV2zcR+e0iW4/JjAeNy/Td4LeTk9TD
 C6PHQQxgyxqASo/rCp9Ru8IaDy7rdkmczuix5Ei7nPRWhGc7Xx9suytKNBlPMLegBlfX
 r+wtQMdfHpCmlzOZMZ3+g3V6UACJaTLB4tbdogN5O6XtRVD7ZT3rJebAyUjZOP+a9YgH Eg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33gp9m8awk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Sep 2020 01:52:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08G1ohhq170487;
 Wed, 16 Sep 2020 01:52:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33h890e9hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 01:52:20 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08G1qIvQ019662;
 Wed, 16 Sep 2020 01:52:18 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Sep 2020 01:52:18 +0000
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH] Rescan the entire target on transport reset when LUN is 0
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq11rj2zdx9.fsf@ca-mkp.ca.oracle.com>
References: <CY4PR02MB33354370E0A81E75DD9DFE74FB520@CY4PR02MB3335.namprd02.prod.outlook.com>
Date: Tue, 15 Sep 2020 21:52:15 -0400
In-Reply-To: <CY4PR02MB33354370E0A81E75DD9DFE74FB520@CY4PR02MB3335.namprd02.prod.outlook.com>
 (Matej Genci's message of "Fri, 28 Aug 2020 12:21:35 +0000")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 suspectscore=1 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160010
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=996
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=1 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160010
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
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


Matej,

> This change introduces the behaviour described above by scanning the
> entire scsi target when LUN is set to 0. This is both a functional and a
> performance fix. It aligns the driver with the spec and allows control
> planes to hotplug targets with large numbers of LUNs without having to
> request a RESCAN for each one of them.

Applied to 5.10/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
