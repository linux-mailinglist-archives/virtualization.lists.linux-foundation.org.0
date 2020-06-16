Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4961FA739
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 06:00:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1B4689443;
	Tue, 16 Jun 2020 04:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZveWjaSY8d5R; Tue, 16 Jun 2020 04:00:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DA3789423;
	Tue, 16 Jun 2020 04:00:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C0D2C016E;
	Tue, 16 Jun 2020 04:00:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5022BC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 04:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35BCD21514
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 04:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zv03V3L4NxOv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 04:00:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by silver.osuosl.org (Postfix) with ESMTPS id 49836203B4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 04:00:31 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G3w8xb194145;
 Tue, 16 Jun 2020 04:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=TkXWLHBUcq6GrqGb8B/sbaIZ/YHDymjYC75g5tesDI8=;
 b=s0bTOq51QseDHq3DCV1eok86CuoPzPpKYMVoC9U62ArE0saDMsnZyPLX69xmMmiHf234
 GhtCzXclPyAD2lvezqNJX8FgmH65sQ9KccDDY5XWfo8Aa7QHwrwmkBM3HdBxQgVizkwR
 TWYYw16ccvp5fkc32sMx4T+djKHsND99VSK/XK3ZASboQzuMEu3UqLhJCMYcF1rztbLF
 8thcP+Q59Z1RQaqEhadQSZY1Ppzp8aM+nArYVhqLkdXswKRcQPS43Kk7a4rkdXR3hFtv
 lGelrDKD8kNKh9uCoaCrNMnAejMfsXhLT4QgfQMCt4BhcPh9j0Tooxa1V88YIFFXPo+U 2Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31p6e5vda1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jun 2020 04:00:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G3xOvH131174;
 Tue, 16 Jun 2020 04:00:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 31p6dcadma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 04:00:09 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05G406xx021363;
 Tue, 16 Jun 2020 04:00:06 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Jun 2020 21:00:06 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 00/17] spelling.txt: /decriptors/descriptors/
Date: Mon, 15 Jun 2020 23:59:55 -0400
Message-Id: <159227986422.24883.1110692977647896521.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160028
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006160027
Cc: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 9 Jun 2020 13:45:53 +0100, Kieran Bingham wrote:

> I wouldn't normally go through spelling fixes, but I caught sight of
> this typo twice, and then foolishly grepped the tree for it, and saw how
> pervasive it was.
> 
> so here I am ... fixing a typo globally... but with an addition in
> scripts/spelling.txt so it shouldn't re-appear ;-)
> 
> [...]

Applied to 5.9/scsi-queue, thanks!

[06/17] scsi: Fix trivial spelling
        https://git.kernel.org/mkp/scsi/c/0a19a725c0ed

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
