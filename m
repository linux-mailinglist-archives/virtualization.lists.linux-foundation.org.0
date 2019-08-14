Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AA8C5D5
	for <lists.virtualization@lfdr.de>; Wed, 14 Aug 2019 04:07:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9D0F0CCC;
	Wed, 14 Aug 2019 02:06:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F0AD6CBE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 02:06:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-oln040092005056.outbound.protection.outlook.com [40.92.5.56])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 66D458D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 02:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=e0++4nP0AduLmtXM4STQy4TZGMYyiUg3Y/h7ZfERP0EUqm5adaPlZ+i47+FuotvNmy+5hKQyCQT4sFfsbWZxB+vIY7FqJCT5QCjYRAd3a32U2dDkbvN4+FE+udLeEq4TqywQVK6QPcSa7uwrhzx7dPPk2v63bJTO3YfnB+2T31peUiteZ9PkT9zsT/KiPfyQPj86lNckpeOv7WJMRAKcaVqgQMlSlEDWISJezZc8Yvit40WsaZedpH4cBOu0GSyUhAqpPLdYNbt+G6OZvVrqKySCaDxrBNa8eYaP7wlitztIsZeV2f3qA+KmKll3M3/vCL3BkO0uxEuhUqhiU574Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cPB3/F3Grc48u/SqSpQpB5aAoIZmhm752HVUD1imrPA=;
	b=YBb5gIoWL9dNvvv8+LuHrZspxyhIPTV6XIHF7nK2SksEEgB25nGWPCdeDZ/ZXuikoFV1/60AZj7csYcNWod/kfbMCGYWVFKl1QROo7vCq4vVyDi+zcy9mekrch2HkuFpdunopqmUFYZFE5Xhuh+dgUHtEVYHARVHm830o57QpL/LwjXoHihZcG/6WL0ZUVBjIVnphM9z1ErLHdREh7izpKlxV4zlvrrEmWXKzX8GGlQzb4jQg0IlWSH1EZFArLVbkfyl4apPVS0PrzIzo7Yc40NE60DoZJ1bxP/jQQHTXjT4trO/oePD1qb/qKVraeCCrf+hvAyDJzNGirn+C7AlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cPB3/F3Grc48u/SqSpQpB5aAoIZmhm752HVUD1imrPA=;
	b=lwXKjAT3Nd7Xo+qkoxRy0VpWxbLS4VIdBc8abjWxfSIr/oeCH/uujl7jbRyssCWx+fXb460hWEboiW7HGp7FjCJKdqQSVsB4ChRFhRaT44v1CYRci6x14p3P+p6rQNxVc3hfRhMS76nTK+UrNeVLNlc5NHDFkLQwIbC14nVgKpaMFAc0XTmtgWA8pBPtLCYztJcGIJwGI03csTJCME8/Dhpy8tDkFtf8zkde8ACilpC63MyhZxLwqhhMa99wnTnFk8RQPCTLjM7bOC4LOO7OUXkmxjHEUV+ZDoZW53HvXD8DqA7V/ttWxdOL8dYCb9KKDC5aVElF9W10OgaGr8TCfQ==
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
	(10.152.76.51) by BL2NAM02HT036.eop-nam02.prod.protection.outlook.com
	(10.152.77.2) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15;
	Wed, 14 Aug 2019 02:06:48 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com (10.152.76.57) by
	BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2157.15 via Frontend Transport; Wed, 14 Aug 2019 02:06:48 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::78fa:660d:3554:e2cf]) by
	BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::78fa:660d:3554:e2cf%7]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 02:06:48 +0000
From: ? jiang <jiangkidd@hotmail.com>
To: "mst@redhat.com" <mst@redhat.com>
Subject: [PATCH] virtio-net: lower min ring num_free for efficiency
Thread-Topic: [PATCH] virtio-net: lower min ring num_free for efficiency
Thread-Index: AQHVUkTuhkka0RnZ2kq2mDYf1nU4uw==
Date: Wed, 14 Aug 2019 02:06:48 +0000
Message-ID: <BYAPR14MB3205E4E194942B0A1A91A222A6AD0@BYAPR14MB3205.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR1501CA0007.namprd15.prod.outlook.com
	(2603:10b6:207:17::20) To BYAPR14MB3205.namprd14.prod.outlook.com
	(2603:10b6:a03:ab::18)
x-incomingtopheadermarker: OriginalChecksum:D9238F3E9942CB0801475107604E9C9CF412FA72FF4400CA3447FB92753186C5;
	UpperCasedChecksum:4FAAAB2E2D56AF1BA8CF7B584DBC169B6C74997B861A56D600BC2E11F5A86BA4;
	SizeAsReceived:8152; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.11.0
x-tmn: [sz4yUBcdoMp3qC2TCUQC+QAtylmoMC53]
x-microsoft-original-message-id: <20190814020635.20427-1-jiangkidd@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: b0omxY8GwpYCO/n+nRAW7YOSOAfqtqfELRAhXiuR1tP9nJEqs4XyahIMBC/Y+mU1RWdOkhSH946humyrD5Vnl4MqO0zV4iM65W83FIZKfqGMEOkHN5tG3DxP6zGDQRCg2axN4cvnnz6zIHPca+IupCYZQZsvHLZbU/oRjAwyhqhMM8dR+XOwCBtpfV8vM0HEPsEG+eHavSvSg5pejmyayjM1mBjo2fct2qbOHpIPZ4OTeKryu/yr3tIW5aAV+e1Sx9RLzLzTcPWRzSLy3gwOzsZPNzJzswRhBfE44NKg4ieJlSSItWa/xxDKpUWGnAUfEsbQoXN+6YcCaOiJoE+1MZxDkFbeSM0G8b0ygdQAoO+U3wxi1UBrCEkhWbe7WMBO0v+ylWPhtpf8lxfhgd1xAnKGmcjvDGuZaCc+a13inkfIgxuv2DB9LK6mBH3jLXPMfMf4dwKCnNEImBvcS3ijFVqZQroVlO2hyM+HArbZyZy/gVTEiZM2UtFqUkD/3CxgrG0Y3vCaHLoce4l6SK5c3Q/sAMQ4xJ+/YfImpv5gziAp8y7ItH9eAmyXKkEx+g58bh0TjQIv+mbayyUN/U/HOmpr8oWH3QgsWUOIenTT7Stnj1DlTZGUDSgGtqmH2aOS+l+Qzw3FWdD5Y8CSgC6IbBfumy6+a8KHL4pqQqLFwiqaNiAgpKFwSAzOMbsS4i2fzzJLGZFneqrxNtT6FQcYX5K9/x6OJG2zI9SOvH2OzktQjrm7Hm1vJ9kg9owACiDP
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:BL2NAM02HT036; 
x-ms-traffictypediagnostic: BL2NAM02HT036:
x-microsoft-antispam-message-info: oO0VdIgpg5aUW5j+T2vjQ3Lsy89VF0r6etoFOpnhs/oUndcb9dx26agxPcwwDZn30oPk8QxRHD0FUj9LE7YkqfufhaIrxCIPz+BhWC5ZwK5MBH1g5bMX3/XcmXH4LOns+0tmpD1OnIuLDbdDAGHb2Y7ksk6BHs8lyCzqY5lFzHZJOBJKHcDqbcxQUW/kFss3
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: da746e6f-1e6c-47f0-a277-08d7205c1053
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 02:06:48.3548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT036
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
