Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E56B53B2
	for <lists.virtualization@lfdr.de>; Fri, 10 Mar 2023 23:04:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8130D60FE9;
	Fri, 10 Mar 2023 22:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8130D60FE9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=zB5Yc5Bf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BQ1ve/SI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyWrpKd2J9eL; Fri, 10 Mar 2023 22:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 53DC560F62;
	Fri, 10 Mar 2023 22:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53DC560F62
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81A96C007F;
	Fri, 10 Mar 2023 22:04:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08192C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3D0D40A37
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D0D40A37
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=zB5Yc5Bf; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=BQ1ve/SI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPcnL9yaHoCs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 543ED408F9
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 543ED408F9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:57 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ALhqbj029130; Fri, 10 Mar 2023 22:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=TD8b+NF7d7DQTr9DJJIoo4mLBEa+PXc0EWbsDetBoC8=;
 b=zB5Yc5Bf+3Bg6kKPoR0BopXTFn698oMPpWLiLoWoyep4+XiuSjC2nAQt2zF77a+6wTfd
 4W+oT8ORHFsKcA5dJG9FrimkupsR1hU8BNk99LEA+hKRxBty68eNxBhvdzgZZp6mlwvH
 uZhrB0eS+zeYNvl6HzjhDVPNgyvQFrzwhX5ElS93KF4lyT3ei3XRGFuC4xeWvSRxKdBo
 jJEJxBx+fh4g1O2kN/BhvIP0I5VrflR0MAdEFeAVlCDN1zPrg3LmUAuEym8JLGMsKXia
 FLXQHANn+nVW2WeqVFVZjGt/Tb5RaY3b6WwPEoLXQMCRkebfDFwBazJECUZQr8Y57G2Q 8g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415j6df4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:47 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32ALm9c9035033; Fri, 10 Mar 2023 22:03:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p6fubfdqs-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4jW6SAPV3ZTxZv40syuXLpTPUjuUatWvhlszBWA52Mvrg5470pqMBYSMRLa4EbeiFvtXlLMuNyZ/OEED7n9iK77LJSx8yfMzGoGtZn6Ca1n4R289Pzz7UOP2biaNOA8TKkxu2/D//69IlaVUBCb+zZfAL1FJ4xowj1Wm267ZjdG5H9+8F3SbU/A/odpfnoST1+mX8Rua1YP0MTbPjcWeN+Mf37jcAk/+25mbpF3Ofr8EWEuGJKpFC6SZhkkDR+DHNYS5eHNDfV0EvQkYKnOb3/Wn1O7ywHidEHaCkxeTG+Fc+teOCvyQvJpfe+DJOOnY45KggXw4IuTbaITn7b8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD8b+NF7d7DQTr9DJJIoo4mLBEa+PXc0EWbsDetBoC8=;
 b=MZARy4pRrj/fG0HdCsq7veIkLdcQ0jPsu2gDTrFvlPaDiLetdpTMSEcvCmVJaS7MwjZ9Em3GbaGuhHlavX1L601qZWUC31FK1sv+JtuF/Guu+WW8lcqaCYH7F1PydNbOxIhozleX8rAxXM81DdY0n4Wy85s9i1z1m/ayejxvoCRhYvF8H7pNA/BTbSqNvYsFsZ+qPJeDBcEYy+skXxz1sOAzljQaRNVbKrXDlkiRT2n8GyMI2POW5NZECbHiJ5GE92gUM2tELOUUvZjwwSwGi/J7OYxIWkrrOcXaVO86ly7dKgNtb8EnAL8/+4xIzOUPXnGi5XS8JWYEsOqjUP3nAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD8b+NF7d7DQTr9DJJIoo4mLBEa+PXc0EWbsDetBoC8=;
 b=BQ1ve/SICcYsNU2bSZLvc/P8gpHkV5Rb29a/AUHjMr1lx7trPluDeIQjGuFFgHgDvCeS0MZGT74n3y57aIZjYo0CnFRJ+FOwdtHggZKDFcvZZ0ykldQZ4bNQdCv2kmIWes1xDO+XWkioAK5PdmyLll7w/q+X+Uyfu3YrRPmWXC4=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 22:03:45 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 22:03:45 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, torvalds@linux-foundation.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] fork: add kernel_clone_args flag to not dup/clone files
Date: Fri, 10 Mar 2023 16:03:27 -0600
Message-Id: <20230310220332.5309-7-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310220332.5309-1-michael.christie@oracle.com>
References: <20230310220332.5309-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM6PR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::21) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c56315b-14ff-482c-5e93-08db21b35123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NPHZG1eryfvxfopxiCmzRkeJ8NHW0Vz6Kn7pPg/Xg2SunKwk3UJ3936O6yy5nOwhCKEhdel87d3vfV2xoAm9nssuiyIpmb/DizV2sPaSkW2d3o1Igp4VeNyevhxFjYtO/sr772TUCRPP3HqH3Y8AXWQZ+mfLPp4oX12ppXCToFEOXWD5QlCH1wUHihJq79MWRy3RNaOR3jaEbYkBB4bdBmjSv7xdDDEnPyKnnh+CaVD8VOTLtM5FnjPDHjCmAvWXDTP9+g+9gh8+Ay7IUFtpZ+BjsT1lj/v4mv5ECN/pmMyoSmAFta5LQgAthfvCvTNJEWNoO18JDe4aod5CuzqhEi0bEj3cOsk75DjJUUqa0tcCjO4axtkMn22I6wvJpZUw4o9GYnniehfOSAm7v5Ii0b/1HdX7C4ZucuOWfA7V8Ec2NnWbvkla9DmGXjFw0yg4GbEd0SIqWR4cmmHQg6Id8s4mF24QRBUn25HUtY0II8H39i3+/a5gynaRaogXUwVcUwDUJ8qhu8ToBwbo7lobrnE5RJK4Z0/Qk8yRgW99wTCJctMRmFkW5lNOvSddmZpYLeI/gETgR2MlhOmMna6ZcfsrShgSs5fr6Rzxr0swasYTXpaj8CUBS7RSj/0x92kC8a7t6ppJqWeLMPnJq7mz7le4iM0SocwHpmRZuGcjhJ6AS1zYrnOZ+AmEhOg1iJrJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(36756003)(6486002)(186003)(6512007)(66556008)(6666004)(2616005)(1076003)(7416002)(83380400001)(26005)(8676002)(66946007)(4326008)(41300700001)(5660300002)(2906002)(66476007)(8936002)(478600001)(6506007)(86362001)(54906003)(316002)(38100700002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c2F6t/vI+yRblQSgXvJUIq0VY5+OWF4XVmyf8wt0Rv7p4KxylzlKuWkPRcvl?=
 =?us-ascii?Q?XQcpSqsZpRLNTWGcYJj13wsrG5FclgOKSV4P8Q+MNX3Ri9bc3IhC1kccO7pH?=
 =?us-ascii?Q?bIqEIfnMCf8Ktvoqkye+3bTSxqJnjdcmbN0gfA8M9dqn9rAHusHxI29uI7VC?=
 =?us-ascii?Q?KbC5Dk/Y/Isot1RLbWzpacpSYBtPknLq+eDXdYWwvCSDithGqIPTwcrgCdb4?=
 =?us-ascii?Q?/sZ9vyNOjcXc18DEj98puoRrEpeiFXZEXOm9VQSppl3DJfIQHHArYYSEB2Po?=
 =?us-ascii?Q?FQBcJhLpII+f7BT41Ld5o1wJgeHuD+xg1KZMwqZLQvlbEzixIow26D2NkgpR?=
 =?us-ascii?Q?S3MnIrzAhdTMJIDOIQ5sb1a557OiQ3dLF/RZu+lXFwW2AjuofeT4xq6KGDWW?=
 =?us-ascii?Q?xroms0dBkVEke9lBt+Kc3lgKJS9JvHZVQc+IqGTRU/CmkkpO9lOq12nKp41f?=
 =?us-ascii?Q?ZQ7h0tpm8HyyV041QW0my/F6IXzlrNdLHy3TjIIUqKE+a/Xv9oAPYa4Xhue3?=
 =?us-ascii?Q?1hsveLa0H9/sMOH+JNB53PWjk9tDvbu+fmHou1Afv2Px2zNFMLumwwYAmRGi?=
 =?us-ascii?Q?0zgZgKZgJHaTPL1K+lbGJywTVZzqoO29XjIhV1NFmdoHjcU91BpPyVl4y8k7?=
 =?us-ascii?Q?ZlmNjIy1XepmxKt3m71NXvXLxp+YaMQkLJLQYInoAZUJnza4/jFrcJXd7FSc?=
 =?us-ascii?Q?ec4IpWyq/316gXILtx3i0OLirqRXX6s5njUSvHszPR8RIX+MnP0MdPjwycZh?=
 =?us-ascii?Q?NoF/TCb4RUe7/OTDNbjVlH81Fycr/CcDDJbPhc+3UwnqYFujs/v5geMs2TNk?=
 =?us-ascii?Q?HfaFLUrB/q7AuEAJEs3UK+8idjHG7rB4v+kcdG2ZEiraINFYCxEgAzmLcafZ?=
 =?us-ascii?Q?8+hF2xjNeAuAJ+I418IEdma1OGUuMUVTg1ZfhmdH+xuq1b27QBnR3g/40k5P?=
 =?us-ascii?Q?Fwl/ZHX1yklBrAjzdZ4uw9r9uE32Uy8hLEyYDlPjvRsVoHZKqvwwQcjZ+Fzl?=
 =?us-ascii?Q?Zmh+d/NzSl/mPEnSmKMpEvJ4ln4WSTXimBCYazcNu3Btiej+mTdbO5oU1gcK?=
 =?us-ascii?Q?8doM+gwN3b4zrziCYTX8f4DeIG2MSGfv46nPNs/X+BVkGBfQR9wtoDtPblQ9?=
 =?us-ascii?Q?7f1iQlg8GtzxhDdFVLcq5NpwQRxYFRkC08lYv14l+R56H4fOxNbutjWXz8pM?=
 =?us-ascii?Q?guzE4Ym2KhBhebKYTiACvrnO7PLsQ7LrXPz3TtWZRdVZ/EIadvQd2koZ91vE?=
 =?us-ascii?Q?9Va24C1dp+aFpPsI/C+S3q/8YcnL0Fur+X0G0pUlJsrrYXN5s8+9FYNeZ26o?=
 =?us-ascii?Q?Aw+DcemwbJENiyf+8D0Jbu4Rv2Itsfb33UpbIUbfu9ntaUHkKoLOgI1CwBvF?=
 =?us-ascii?Q?T7omJcNPlCdGPmAKn16FOm3u0gEdPi/fIQuCRd/E0HycA8UZg4C9Hxos3SsJ?=
 =?us-ascii?Q?qLqAlBtZcTICcZEk8B4gvG3eZaYGhL+Nfwjrgxi1IWS0Ub9k7xr2Nv+qqzll?=
 =?us-ascii?Q?kbbkHVlNRpK9qc3wo2277fQAAbj+nZuuuLYuOJwac3dYxEKECKGfVjOMFQO0?=
 =?us-ascii?Q?WwQTH6+a1LVTbozSCamDMOnodMqvq+Vx53B/HDM8fSgR4khY4UnxvcvsanaO?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?mbbkuhL8BB+EcF/8T2hbMOmymLjKwhMZI1XzfQffLTgXAbUxC9vLsPeLJrlB?=
 =?us-ascii?Q?Bfgf/Kj7RUpuYwH/sdBydNHK7Eaqh7kW7dBk0oVLn3Qm3xD4mFGlUcyIWSpf?=
 =?us-ascii?Q?+LBq2HAEI6CO/Qa+y45sxA85+sbYMCxa78Js9EoMxZL+s78iD4DOXMp2+PcS?=
 =?us-ascii?Q?m2SHYreWjlKzzl038CY3oSoNZenyuZQhP9x7L9dj4XWP2lYJa39MBCaC6mL3?=
 =?us-ascii?Q?8p2Qs4M8kbcUZkWlmyluUlzsaEolb83CFO6cq1ImQ0DzeKKuFU7qYFZ5AGs7?=
 =?us-ascii?Q?x++nzvni8srLU7KltgGtlxuHpRs6lFAm75BRgC4ugBJsOd4yt9Nso1zpnujo?=
 =?us-ascii?Q?jqbsO9qWDgYzZhG9tcn7dE/MVVHWOWUPUvHtokEfvL9KBZXrnJGWTR+p2gCr?=
 =?us-ascii?Q?j5xuIGd+RzDdsX8nlqIQZRv/evmUDUhS4T4BktrVYUJ1QmZhihlx572bXJjg?=
 =?us-ascii?Q?avFo5h41xvFGx7DiNxmXw9+YiWgicxbkn38Bi8Pd/lA0kzPxdEIwXVTafA9+?=
 =?us-ascii?Q?ZEq+VjqAVqJjJyfWPLtz0nAegx1ESMm5S8ut+WKTObOafH4qWJ7NrHDKM/z+?=
 =?us-ascii?Q?/wauF5+jNGhdU2MzwVsNerfAG/6/MFIDzaJuF579cfURABYfH3ZGtmz1jbCr?=
 =?us-ascii?Q?38+ZRxoxgfr8CUWlctNSrQ0nFKsejt102cYSmNXjlH/qksjUMUyF9GcrmAZ7?=
 =?us-ascii?Q?KfFK7hJ+fcIiI3sXQx3ZEN2ajGgHiYlKZNsSBxyhJiFM7ZnW8DeJt3BUJnFB?=
 =?us-ascii?Q?3h6zmk7DKqRKcRLbr0Dtcs42ZWwMfVIZCtWA2OQ+BBZ2/BjP85l3nItJF4r3?=
 =?us-ascii?Q?19cKj/chXwGU0IvLBp/Z34BvC8VUfEGlPj3U2fZytnSwHOf8sOAVFxIpAFC9?=
 =?us-ascii?Q?TnoW4eBERUMo0vmXMUyvJ/Yk/K0nPyGH7HZILKH/J0H+s/9Vothrpv/POVje?=
 =?us-ascii?Q?mBiNvebX7Z2eyPtcenVtK9SgQYTeNFK9tY3rJv/zYXp1DGDjChu+hcvATntR?=
 =?us-ascii?Q?lQ1PjtwSQefHeqx1iAoszKDuN6zdk7nOEYSpD3wetKBVY4I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c56315b-14ff-482c-5e93-08db21b35123
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 22:03:44.8598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMxCX90nlpuzAk9OIqreSOOZp+SXuZbXeN74YbbwnApWkm0qOfnAh6tBubwY+xZkf/1Uw6naT7fwjp4EuCkAUf+Q4V6bgTX7UrqrZibNn+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100176
X-Proofpoint-GUID: yunMcCpsoCdzbFHPRgbhRnZbPQ69Re0O
X-Proofpoint-ORIG-GUID: yunMcCpsoCdzbFHPRgbhRnZbPQ69Re0O
Cc: Christoph Hellwig <hch@lst.de>
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

Each vhost device gets a thread that is used to perform IO and management
operations. Instead of a thread that is accessing a device, the thread is
part of the device, so when it creates a thread using a helper based on
copy_process we can't dup or clone the parent's files/FDS because it
would do an extra increment on ourself.

Later, when we do:

Qemu process exits:
        do_exit -> exit_files -> put_files_struct -> close_files

we would leak the device's resources because of that extra refcount
on the fd or file_struct.

This patch adds a no_files option so these worker threads can prevent
taking an extra refcount on themselves.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Acked-by: Christian Brauner <brauner@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/sched/task.h |  1 +
 kernel/fork.c              | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 2950e83d5382..4f816048794f 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -28,6 +28,7 @@ struct kernel_clone_args {
 	u32 kthread:1;
 	u32 io_thread:1;
 	u32 user_worker:1;
+	u32 no_files:1;
 	unsigned long stack;
 	unsigned long stack_size;
 	unsigned long tls;
diff --git a/kernel/fork.c b/kernel/fork.c
index 0dec38276363..258163ea5cd2 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1624,7 +1624,8 @@ static int copy_fs(unsigned long clone_flags, struct task_struct *tsk)
 	return 0;
 }
 
-static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
+static int copy_files(unsigned long clone_flags, struct task_struct *tsk,
+		      int no_files)
 {
 	struct files_struct *oldf, *newf;
 	int error = 0;
@@ -1636,6 +1637,11 @@ static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
 	if (!oldf)
 		goto out;
 
+	if (no_files) {
+		tsk->files = NULL;
+		goto out;
+	}
+
 	if (clone_flags & CLONE_FILES) {
 		atomic_inc(&oldf->count);
 		goto out;
@@ -2256,7 +2262,7 @@ static __latent_entropy struct task_struct *copy_process(
 	retval = copy_semundo(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_security;
-	retval = copy_files(clone_flags, p);
+	retval = copy_files(clone_flags, p, args->no_files);
 	if (retval)
 		goto bad_fork_cleanup_semundo;
 	retval = copy_fs(clone_flags, p);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
