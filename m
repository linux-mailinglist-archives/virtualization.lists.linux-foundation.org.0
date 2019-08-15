Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616F8E879
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 11:42:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1757A10F7;
	Thu, 15 Aug 2019 09:42:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 88A3210EC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 09:42:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-oln040092010059.outbound.protection.outlook.com [40.92.10.59])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D2D1D87E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 09:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=JsEkAhTztUcUXZUEZpkJHEz/+DVGEZjHlzT5OCkNxSRb/CzFpipjJpPvn8aPl+A+A2B79PrwMNjGtJV/E0c3OpTbGMhsJCCI5Ka33HGmwQLjHaFTqlKqcqOJv0cwHkZ6IUXyBu42fLzXmWjNG/HR0go94hrPV6DulXdeN1r0hQBWIPpQQX6XXMNF5eHcYdDCjh8hetqHfBh20AkCCL3tMjeb/QsyYzJtvrjqbNs/VM7ExVgyDDWkbHFRdtqdVketT7hi3DrtxPaLRw1Wsj6BWF+gsHZELhors2fLzuVRAFQOv24U3/GcP+fTxBhxTTTlHXWlNHuSwd0hTLIrZLM4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=b+l9Wlsm7LaDWh/rIUDW17V7U6LshHyebrcvrSrcfms=;
	b=jp5gGXLUMr2jpyZjHnSQXq1PrprrfJlRGZNxi3EyYzJaJ2G470LrVhZCdv3fO4C7GrOSaC1+E6pWBqvSDN7hXgskGig7MV3wp4NcxA+X/5Npokp4dkQ2vW6huqo/MpNylwvsBFHBFhdJc5OwprQp2FQGQNMlr0teiSyKmvKGHmqUCq3IdsBGnXrtHs4mEoXI5XuwwWonpC9U4QooApHmC/+0DW8+olczFWyL5I6Vp+pJFsC+U2no77nPjisvUk4RSKrFaihY9gj0XF/v/4Ezcli0ZZEVN+WhqYmxzXgLP5csZ1zBBHedDQNr2cnFX71s4LYw9uwksvw/A/CSH+z3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=b+l9Wlsm7LaDWh/rIUDW17V7U6LshHyebrcvrSrcfms=;
	b=INDYKCF+caprMRZ/3obLNql9CpIIpvX36bXWouj2rRIQUxo2j8EefXijmhztkKa6gWjrAr/WrTUS8e2S4uibAX+kEdbjcJWDpXH3ISx2PYMwf+wWBenzbMA/tB+99a8JYpYqPwZ3P35OmA1P/H7aKbVT8p7i0O6Uxzd5LA0+UpHpLCUXyQTBhaae1kC5mz3eLXkUibj3wJZw0Ag8WJoQ5OYuP4ZBD+dPP3dy19KRaYE6Ax24MkqWh/7meHLO3jvhE0IwflRv7E6b7ZshqOf7cFbEA++WS579l9OtFUCqcymtlKvDpMQme7C00XvhnZatyXIWtQ5l3/wE58qsviqUTg==
Received: from BN3NAM04FT055.eop-NAM04.prod.protection.outlook.com
	(10.152.92.55) by BN3NAM04HT115.eop-NAM04.prod.protection.outlook.com
	(10.152.93.11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16;
	Thu, 15 Aug 2019 09:42:40 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com (10.152.92.60) by
	BN3NAM04FT055.mail.protection.outlook.com (10.152.93.43) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.15 via Frontend Transport; Thu, 15 Aug 2019 09:42:40 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::78fa:660d:3554:e2cf]) by
	BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::78fa:660d:3554:e2cf%7]) with mapi id 15.20.2157.022;
	Thu, 15 Aug 2019 09:42:40 +0000
From: ? jiang <jiangkidd@hotmail.com>
To: "mst@redhat.com" <mst@redhat.com>
Subject: [PATCH v2] virtio-net: lower min ring num_free for efficiency
Thread-Topic: [PATCH v2] virtio-net: lower min ring num_free for efficiency
Thread-Index: AQHVU03Hoa9VikxJeEGLbvNZK8132A==
Date: Thu, 15 Aug 2019 09:42:40 +0000
Message-ID: <BYAPR14MB32058F4B2AD162F5421BB9B4A6AC0@BYAPR14MB3205.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR01CA0004.prod.exchangelabs.com (2603:10b6:208:10c::17)
	To BYAPR14MB3205.namprd14.prod.outlook.com
	(2603:10b6:a03:ab::18)
x-incomingtopheadermarker: OriginalChecksum:6924D8979B5664D02B98497C05604D778226D5B7C7249B2EB313E0953FE23E4B;
	UpperCasedChecksum:1A8E64A3D4D02EC489F21169D5FF58332726440BE2613F1DB0C030A75EB7BFF2;
	SizeAsReceived:8148; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.11.0
x-tmn: [WEZwIH5l27S/mGKa/0g7vKt9ounIZfc1]
x-microsoft-original-message-id: <20190815094229.23407-1-jiangkidd@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: b0omxY8GwpY0J6bqZhF/j0NxURoZc6Cpj1tQrW/cBmdmjvAn/IL3DFSigk5cQLRlkRIjsJwkAeqypxUezjEAFpbS5SvrXP9P9cF4ODz4xDgwO0wf/35vkPB4a8MwnAWKK5KW92L5ScVRht7XpcXb87qy+XU81AgMepqgUofb2m1+f6OEjcsNKCvtD90hLwvNlVBDbUqcMzGi/f7m8mMa3BKY+gsG+pHUtSSJ9oBxg01bSru3HhlgxYnmEQXKprEAMmWuixAGiSpaXmdyBah8Zp7Yub7jTRXEMDw4WYhxLOE0dJidzsZhqyK2IAuRrVLeKmo2zmqg8rV9ub+CMquSTpCphRY1j8XjW82KKaIGyK0oBbbiiH4bsnwf2RuclifC43NCaG1WPG5Q4SYIzMg3PWwK5JzFmxJ3T871TR+cZJSthaVjyiwWS/YpOcZOVgiTa5U2M5bjaWdsohpc/BgIryJFc/qIGJP7tm4sqyOpAydtV4Ju8YnmaqdWJtZZmOkmx5rTire+7bZHRBaRsE8QC3G1zapc49EB7wTdsUCkelFBde+tZB5zntjQtKTi8G+dJ2HUXaPbC4sQSmo+ySJE33Rhtd964hHU2ejqfEK/QgfJoNCztvn71+OpbgSn2K6SEQmK/WmJ6i8/VHqbCxgg2+U0HAhwcjkd7wx0ChU8K8pOAJdio6SISF85b0mS1ppkO+EVzPCe6lIKqIS/2IpRkEP7A3hYxHv3RyYvLq47QF4ziEpNAeE2IkM3QEPbmYPQ
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:BN3NAM04HT115; 
x-ms-traffictypediagnostic: BN3NAM04HT115:
x-microsoft-antispam-message-info: Q7tXK9H0Sb5oSNtjBhbtxTVNq9nSH8x1IGg6Lk4bEbc97yHkdfvBKqYmkCfqAphcDyYQl5hhMmaTSky9riuFl08iHQ19PAEXimDWOUnpZFzqXyMDMrn5rujDWuk7EhrUrhgvkTCR11LeC2B/QzgPK1pD2Kjm5bzewscE5m1UHR8gOtYHSvPElVE6tPomfnvM
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3b8ed2-1405-4052-1f2b-08d72164e9ab
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 09:42:40.0924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT115
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	? jiang <jiangkidd@hotmail.com>, "yhs@fb.com" <yhs@fb.com>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

This change lowers ring buffer reclaim threshold from 1/2*queue to budget
for better performance. According to our test with qemu + dpdk, packet
dropping happens when the guest is not able to provide free buffer in
avail ring timely with default 1/2*queue. The value in the patch has been
tested and does show better performance.

Test setup: iperf3 to generate packets to guest (total 30mins, pps 400k, UDP)
avg packets drop before: 2842
avg packets drop after: 360(-87.3%)

Signed-off-by: jiangkidd <jiangkidd@hotmail.com>
---
 drivers/net/virtio_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0d4115c9e20b..bc08be7925eb 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1331,7 +1331,7 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 		}
 	}
 
-	if (rq->vq->num_free > virtqueue_get_vring_size(rq->vq) / 2) {
+	if (rq->vq->num_free > min((unsigned int)budget, virtqueue_get_vring_size(rq->vq)) / 2) {
 		if (!try_fill_recv(vi, rq, GFP_ATOMIC))
 			schedule_delayed_work(&vi->refill, 0);
 	}
-- 
2.11.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
