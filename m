Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 001BA7ACB1C
	for <lists.virtualization@lfdr.de>; Sun, 24 Sep 2023 19:40:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D83EA81431;
	Sun, 24 Sep 2023 17:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83EA81431
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rhz+Gc8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jb7c0Ub67LtT; Sun, 24 Sep 2023 17:40:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B35C78140A;
	Sun, 24 Sep 2023 17:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B35C78140A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD7EEC008C;
	Sun, 24 Sep 2023 17:40:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC328C0032
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 17:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB73860E4E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 17:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB73860E4E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=Rhz+Gc8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBlbmAkLBGWA
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 17:40:00 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57EF260E4C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57EF260E4C
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38OGehq2006698; Sun, 24 Sep 2023 17:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=a2ctV+9L4kKCcLREiZQedto4qlgkJw8bUeFgjqbh5As=;
 b=Rhz+Gc8BTaoyzxlAeAH0FGE9+e9Kqa3pXNo6DwyLFoHRHTNKdM2ZTrhbapgsVuIlHzk7
 dgGnP2WqFB6N7bIkIrF9WiSHOKmtQbvpKZsBK1L+c+npfC3vunTw89c8KMlc6DrWLTt2
 IFbDpsChFjf8CIGpkY5P3U1oQpmny0h/xu4MNyfqo9/7h1NejWsW+/Gzt0x0nyUVPJLE
 WdPEmPUdXCP474I50K8kg2NWxoOKuWsz1Vx2QMJ+CWz/lHsjkRw2qc/rTDyrq5g/qR50
 uCICtyTff+gVgp+UOesRNcg7Mvx0ukKIs0dBWYiIwucg5j6eNAFeFsJ820is37qC4cLu aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta5hb0bmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Sep 2023 17:39:47 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38OHdlkB003823;
 Sun, 24 Sep 2023 17:39:47 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta5hb0bmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Sep 2023 17:39:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38OFaLvj030753; Sun, 24 Sep 2023 17:39:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tacjjc3n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Sep 2023 17:39:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38OHdhVc27394696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 24 Sep 2023 17:39:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE5C92004B;
 Sun, 24 Sep 2023 17:39:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C618B20040;
 Sun, 24 Sep 2023 17:39:42 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.29.239])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
 Sun, 24 Sep 2023 17:39:42 +0000 (GMT)
Date: Sun, 24 Sep 2023 19:39:41 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: virtcrypto_dataq_callback calls crypto_finalize_request() from
 irq context
Message-ID: <20230924193941.6a02237f.pasic@linux.ibm.com>
In-Reply-To: <ed47fb73ad634ca395bd6c8e979dda8e@huawei.com>
References: <20230922154546.4f7447ce.pasic@linux.ibm.com>
 <ed47fb73ad634ca395bd6c8e979dda8e@huawei.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OAd7c8O-FiD8N90yvnR-OhbKEtCwd40N
X-Proofpoint-ORIG-GUID: D7Y4RHuy_ajhhRgET4pDTmKzK3fghQZR
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-24_15,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=951 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309240154
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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

On Sun, 24 Sep 2023 11:56:25 +0000
"Gonglei (Arei)" <arei.gonglei@huawei.com> wrote:

> Hi Halil,
> 
> Commit 4058cf08945 introduced a check for detecting crypto completion function 
> called with enable BH, and indeed the virtio-crypto driver didn't disable BH, which needs
> a patch to fix it.
> 
> P.S.: https://lore.kernel.org/lkml/20220221120833.2618733-5-clabbe@baylibre.com/T/
> 
> Regards,
> -Gonglei

Thanks Gonglei!

Thanks! I would be glad to test that fix on s390x. Are you about to send
one?

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
