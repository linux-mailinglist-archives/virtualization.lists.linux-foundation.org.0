Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BBAEDDE
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 16:54:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 50C9DDD0;
	Tue, 10 Sep 2019 14:54:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5381DC6D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 14:54:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E56B38AA
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 14:54:29 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x8AEsRYj021240; Tue, 10 Sep 2019 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : mime-version : content-type; s=corp-2019-08-05;
	bh=LyJPiURs4hN/FEJaBGWF5jRt285M/pc7eYLduJ7yKYc=;
	b=RYYkQbJbuTQTDjMRX6XWrJbtWfttM4eF0WwFsBBz4c6KwVzr48yyBjZjoXRHFi8yCcz/
	ZnD9ZEI/jEq7frTaf3PRtd07a0XAtXOgDYIwgItmQijpZisWqtk6Azn0Z++Wa4ZN+FQ6
	9gfWB3VjR6QNy6W0LtkARWwwYwgAmMs19hbfSoWrV+qxII2muYU7No6XDNMBn8NzqxlP
	yax1wuvHV+yDBrEqdZ1a9Z9e4+4XyynwKM+53L5n6WOAv3fhQElMssd7momXyNYgzPeq
	s2C/kBfgh9f21VxfSEjreHZbgWyQnOIcvfQHlqlJu0YwqxRnDNPztKm6RHTbhAR2bDYh
	Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2uw1m8v19g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2019 14:54:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x8AEsMhp104294; Tue, 10 Sep 2019 14:54:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 2uwq9q4b12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2019 14:54:24 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8AErQ4f016550;
	Tue, 10 Sep 2019 14:53:26 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Sep 2019 07:53:26 -0700
Date: Tue, 10 Sep 2019 17:53:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jgross@suse.com
Subject: [bug report] x86/paravirt: Use a single ops structure
Message-ID: <20190910145320.GA1479@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=702
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1909100144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=768
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1909100144
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
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

Hello Juergen Gross,

The patch 5c83511bdb98: "x86/paravirt: Use a single ops structure"
from Aug 28, 2018, leads to the following static checker warning:

	arch/x86/kernel/paravirt.c:123 paravirt_patch_default()
	warn: uncapped user index '*(&pv_ops + type)'

	arch/x86/kernel/paravirt.c:124 paravirt_patch_default()
	error: buffer overflow '&pv_ops' 90 <= 255 user_rl='0-255'

arch/x86/kernel/paravirt.c
   116  unsigned paravirt_patch_default(u8 type, void *insn_buff,
   117                                  unsigned long addr, unsigned len)
   118  {
   119          /*
   120           * Neat trick to map patch type back to the call within the
   121           * corresponding structure.
   122           */
   123          void *opfunc = *((void **)&pv_ops + type);
                                          ^^^^^^^^^^^^^^
This code is actually pretty old...

This isn't a security issue, but the size of &pv_ops is variable but
type isn't checked so we could be reading beyond the end.  We could do
something like:

        if (type >= sizeof(pv_ops) / sizeof(void *))
                return -EINVAL;
	opfunc = *((void **)&pv_ops + type);

   124          unsigned ret;
   125  
   126          if (opfunc == NULL)
   127                  /* If there's no function, patch it with a ud2a (BUG) */
   128                  ret = paravirt_patch_insns(insn_buff, len, ud2a, ud2a+sizeof(ud2a));
   129          else if (opfunc == _paravirt_nop)
   130                  ret = 0;
   131  

regards,
dan carpenter
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
